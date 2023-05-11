class CarsController < InheritedResources::Base

  private

  def log
    @car = Car.find(params[:id])
    @log = @car.log || @car.build_log
  end

  def collection
    if current_user
      @service_exists = current_user.service_id
      @cars = current_user.cars
      @current_user_email = current_user.email
      @permitted_to_own_service = current_user.permission_to_become_service_owner
      # @has_service = current_user.service.id



    end
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :fuel_type, :engine_size, :transmission, :body_type, :mileage, :notes, :user_id)
  end

end

# class CarsController < ApplicationController
#
#   def index
#     # Get all cars of the current user if logged in or redirect to login page
#     if current_user
#       @cars = current_user.cars
#       @current_user = current_user.email
#     else
#       redirect_to new_user_session_path
#     end
#   end
#
#   def show
#     # Get the car with the id from the url
#     @car = Car.find(params[:id])
#   end
#
#   def new
#     # Create a new car instance
#     @car = Car.new
#   end
#
#   def create
#     # Create a new car instance with the params from the form
#     @car = Car.new(car_params)
#     # Set the user_id of the car to the current user
#     @car.user_id = current_user.id
#     # Save the car to the database
#     if @car.save
#       # Redirect to the show page of the car
#       redirect_to @car
#     else
#       # Render the new page again
#       render 'new'
#     end
#   end
#
#   def edit
#     # Get the car with the id from the url
#     @car = Car.find(params[:id])
#   end
#
#   def update
#     # Get the car with the id from the url
#     @car = Car.find(params[:id])
#     # Update the car with the params from the form
#     if @car.update(car_params)
#       # Redirect to the show page of the car
#       redirect_to @car
#     else
#       # Render the edit page again
#       render 'edit'
#     end
#   end
#
# end