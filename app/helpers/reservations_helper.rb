module ReservationsHelper
  def format_date(reservation_date)
    reservation_date.strftime("%B %e, %Y")
  end

  def format_time(reservation_time)
    reservation_time.strftime("%l:%M %p")
  end
end
