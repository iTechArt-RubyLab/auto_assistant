class CarsController < InheritedResources::Base
  def new
    @car = Car.new
    @user_id = current_user.id
    super
  end

  def edit
    @car =  Car.find(params[:id])
    @user_id = current_user.id

    super


  end

  private

  def log
    @car = Car.find(params[:id])
    @log = @car.log || @car.build_log
  end

  def collection
    if current_user
      @user_id = current_user.id
      @service_exists = current_user.service_id
      @cars = current_user.cars
      @current_user_email = current_user.email
      @permitted_to_own_service = current_user.permission_to_become_service_owner


    end
  end



  def car_params
    params.require(:car).permit(:make, :model, :year, :fuel_type, :engine_size, :transmission, :body_type, :mileage, :notes, :user_id)
  end

end
