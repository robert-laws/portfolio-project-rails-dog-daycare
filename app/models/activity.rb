class Activity < ApplicationRecord
  has_many :location_activities, dependent: :destroy
  has_many :locations, through: :location_activities
  has_many :reservation_activities, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :best_for_size, presence: true
  validates :best_for_type, presence: true
  validates :energy_usage, presence: true

  scope :uniq_values, ->(column){ distinct.pluck(column).delete_if{|e| [] << e if e == "custom"}.sort }
  scope :all_except_custom, -> { where("custom = ?", false) }

  def self.by_select(which_column, value)
    where("#{which_column} = ?", value)
  end

  def self.activity_columns
    ["best_for_size", "best_for_type", "energy_usage"]
  end

  def self.top
    joins(:reservation_activities).group('activities.id').having('count(activity_id) > ?', 0).order('count(activity_id)').reverse.first
  end
end
