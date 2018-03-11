class Address < ApplicationRecord
  belongs_to :user

  validates :street_1, presence: true
end
