class ServicesController < ApplicationController
  before_action :authenticate_user!

  def new
    @service = Service.new
  end

  def show
    @service = Service.find(params[:id])
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find_by(id: params[:id])

    if @service
      if @service.update(service_params)
        redirect_to @service, notice: 'Service was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to root_path, alert: 'Service not found.'
    end
  end
  def create
    @service = Service.new(service_params)
    # @service.user = current_user

    if @service.save
      current_user.update(service_id: @service.id)
      redirect_to @service, notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :email, :password_digest, :contact, :service_type
                                                                                   )
  end
end
