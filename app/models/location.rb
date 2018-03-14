class Location < ApplicationRecord
  has_many :location_activities, dependent: :destroy
  has_many :activities, through: :location_activities

  accepts_nested_attributes_for :activities

  scope :min_value, ->(column){ minimum(column) }
  scope :max_value, ->(column){ maximum(column) }

  def self.city_list
    select(:city).collect { |c| c.city }.uniq.sort
  end

  def self.values_between(column, min, max)
    where("#{column} >= ? AND #{column} <= ?", min, max)
  end

  def self.select_by_city(city)
    where("city = ?", city)
  end

  def activities_attributes=(activity_attributes)
    activity_attributes.values.each do |activity_attribute|
      if activity_attribute[:id].present?
        activity = Activity.find_by(id: activity_attribute[:id])
        activity.update(activity_attribute)
      else
        if activity_attribute[:name].present?
          activity = Activity.find_or_create_by(activity_attribute)
          self.activities << activity
        end
      end
    end
  end
end
