class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    @daily_rate = @car.price_per_day

    if params[:car_id].present?
      car = Car.find(params[:car_id])
      @daily_rate = car.price_per_day
    end
  end

  def create
    puts params.inspect
    @car = Car.find(booking_params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user

    if @booking.save
      BookingMailer.booking_request_email(@car.user.email, @booking, current_user).deliver_now
      redirect_to root_path, notice: "Booking request sent to the car owner"
    else
      render :new
    end
  end

  def index
    @bookings = current_user.cars.map(&:bookings).flatten
  end

  def show
    @booking = Booking.find(params[:id])
  end




  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id, :user_id, :totalprice )
  end

end
