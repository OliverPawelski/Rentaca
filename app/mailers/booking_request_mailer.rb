class BookingRequestMailer < ApplicationMailer
  def booking_request_email(car_owner_email, booking, current_user)
    @car_owner_email = car_owner_email
    @booking = booking
    @car = booking.car
    @renter = current_user
    @start_date = booking.start_date
    @end_date = booking.end_date
    @total_price = booking.totalprice
    @daily_rate = @car.price_per_day

    mail(to: car_owner_email, subject: "New Booking Request")
  end
end
