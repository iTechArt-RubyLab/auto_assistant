class ServicesController < InheritedResources::Base
  def refuel
    @service = Service.find(params[:id])
    @car = Car.find(params[:id])
    @service.refuel(params[:service][:car][:date])
    redirect_to @service.car, notice: "Car has been refueled"
  end

  private

    def service_params
      params.require(:service).permit(:name, :email, :password_digest, :contact, :service_type)
    end

end
