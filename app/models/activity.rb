class Activity < ApplicationRecord
  has_many :location_activities, dependent: :destroy
  has_many :locations, through: :location_activities

  scope :uniq_values, ->(column){ distinct.pluck(column).sort }
  scope :all_except_custom, -> { where("custom = ?", false) }

  def self.by_select(which_column, value)
    where("#{which_column} = ?", value)
  end
end
