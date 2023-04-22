class CarsController < InheritedResources::Base

  private

    def car_params
      params.require(:car).permit(:make, :model, :year, :fuel_type, :engine_size, :transmission, :body_type, :mileage, :notes, :user_id, :service_id)
    end

end
