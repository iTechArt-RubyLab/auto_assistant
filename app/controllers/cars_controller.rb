class CarsController < ApplicationController
  def index
    @cars = @user ? current_user.cars : Car.all
    @am_im_signed = user_signed_in?
    @my_email = current_user.email
  end

  def show
    @car = Car.find(params[:id])
    # @cars = current_user.cars
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car
    else
      render 'new'
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to @car
    else
      render 'edit'
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :user_id)

  end

  #get cars of authenticated user
  def my_cars
    @cars = current_user.cars
    @user = current_user.email

  end
end
