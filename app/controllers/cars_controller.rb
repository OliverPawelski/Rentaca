class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

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

  def edit
    @car
  end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: "Car updated"
    else
      render :edit
    end
  end

  def user_cars
    @user_cars = current_user.cars
  end

  def destroy
    set_car
    @car.destroy
    redirect_to cars_path, status: :see_other
  end
  private


  def set_car
    @car = Car.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Car with ID #{params[:id]} not found."
    redirect_to cars_path
  end

  def car_params
    params.require(:car).permit(:name, :colour, :price_per_day, :location, :registration_number, :image)
  end
end
