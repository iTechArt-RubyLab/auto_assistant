class ServicesController < InheritedResources::Base

  private

    def service_params
      params.require(:service).permit(:name, :email, :password_digest, :contact, :service_type)
    end

end
