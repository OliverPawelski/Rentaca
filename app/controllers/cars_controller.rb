class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to car_path(@car)
  end


  private

  def car_params
    params.require(:car).permit(:name, :colour, :price_per_day, :location, :registration_number)
  end
end
