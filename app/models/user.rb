class User < ApplicationRecord
  has_secure_password

  has_many :addresses, dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :reservations, dependent: :destroy

  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :dogs

  validates :username, presence: true, uniqueness: true, format: { without: /\s/, message: "must be a single word" }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, length: { minimum: 6 }, unless: :user_created
  # validates_associated :addresses
  # validates_associated :dogs
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  # Omniauth login
  def self.find_or_create_by_omniauth(auth_hash)
    oauth_email = auth_hash["info"]["email"]
    where(email: oauth_email).first_or_create do |user|
      user.username = oauth_email.split("@")[0]
      user.password = SecureRandom.hex
    end
  end

  # Addresses
  def addresses_attributes=(address_attributes)
    address_attributes.values.each do |address_attribute|
      if address_attribute[:id].present?
        address = Address.find_by(id: address_attribute[:id])
        address.update(address_attribute)
      else
        if address_attribute[:street_1].present?
          address = Address.find_or_create_by(address_attribute)
          self.addresses << address
        end
      end
    end
  end

  # Dogs
  def dogs_attributes=(dog_attributes)
    dog_attributes.values.each do |dog_attribute|
      if dog_attribute[:id].present?
        dog = Dog.find_by(id: dog_attribute[:id])
        dog.update(dog_attribute)
      else
        if dog_attribute[:name].present?
          dog = Dog.find_or_create_by(dog_attribute)
          self.dogs << dog
        end
      end
    end
  end

  private

  def user_created
    self.id.present?
  end
end
