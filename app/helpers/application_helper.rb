module ApplicationHelper
  def full_page_title(page_title = '')
    base_title = "Dog Daycare"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def find_duration(reservation_id, activity_id)
    ra = ReservationActivity.find_by(reservation_id: reservation_id, activity_id: activity_id)
    if ra
      ra.duration
    else
      ''
    end
  end
end
