class Dog < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :breed, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :sex, inclusion: { in: %w(male female), message: "Make a valid selection for sex" }

  def self.user_dogs(user_id)
    where("user_id = ?", user_id)
  end
end
