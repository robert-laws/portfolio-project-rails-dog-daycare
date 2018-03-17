class Reservation < ApplicationRecord
  has_many :reservation_activities, dependent: :destroy
  has_many :activities, through: :reservation_activities
  belongs_to :user

  validates :date, presence: true
  validates :drop_off_time, presence: true
  validates :pick_up_time, presence: true

  accepts_nested_attributes_for :reservation_activities
  accepts_nested_attributes_for :activities

  def reservation_activities_attributes=(reservation_activity_attributes)
    reservation_activity_attributes.values.each do |reservation_activity_attribute|
      activity_attributes = reservation_activity_attribute["activities"]
      if activity_attributes["name"].present?
        activity = Activity.find_or_create_by(name: activity_attributes["name"], description: activity_attributes["description"], best_for_size: activity_attributes["best_for_size"], best_for_type: activity_attributes["best_for_type"], energy_usage: activity_attributes["energy_usage"], custom: activity_attributes["custom"])
        reservation_activity = ReservationActivity.new(duration: reservation_activity_attribute["duration"], activity: activity)
        self.reservation_activities << reservation_activity
      end
    end
  end

  def activity_ids=(ids)
    if ids.size == 1 && ids[0] == ""
      reservation_id = self.id
      if reservation_id.present?
        destroy_reservation_activities_by_reservation_id(reservation_id)
      end
    end
  end

  def durations=(ds)
    reservation_id = self.id
    if reservation_id.present?
      destroy_reservation_activities_by_reservation_id(reservation_id)
    end
    ds.each do |key, value|
      if value.present?
        activity = Activity.find_or_create_by(id: key)
        reservation_activity = ReservationActivity.new(duration: value, activity: activity)
        self.reservation_activities << reservation_activity
      end
    end
  end

  private

  def destroy_reservation_activities_by_reservation_id(reservation_id)
    ReservationActivity.where(reservation_id: reservation_id).destroy_all
  end
end
