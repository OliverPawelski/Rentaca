class CarsController < ApplicationController

  def index
    if params[:search]
      @cars = Car.where("name LIKE ?", "%#{params[:search]}")
    else
      @cars = Car.all
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to car_path(@car)
  end

  def show
    @car = Car.find(params[:id])
  end

  def search
    if @car = Car.find_by_id(params[:id])
      render :show
    else
      flash[:alert] = "Car with ID #{params[:id]} not found."
      redirect_to cars_path
    end
  end

  private

  def car_params
    params.require(:car).permit(:name, :colour, :price_per_day, :location, :registration_number)
  end
end
