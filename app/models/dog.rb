class Dog < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :breed, presence: true
  validates :sex, inclusion: { in: %w(male female), message: "Make a valid selection for sex" }
end
