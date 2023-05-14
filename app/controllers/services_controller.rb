class ServicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @services = Service.all

  end

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
    create_or_delete_services_tags(@service, params[:service][:tags])


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
    create_or_delete_services_tags(@service, params[:service][:tags])
    # @service.user = current_user

    if @service.save
      current_user.update(service_id: @service.id)
      redirect_to @service, notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  def create_or_delete_services_tags(service, tags)
    service.taggables.destroy_all
    tags = tags.strip.split(',')
    tags.each do |tag|
      service.tags << Tag.find_or_create_by(name: tag)
    end

  end

  private

  def service_params
    params.require(:service).permit(:name, :email, :password_digest, :contact, :service_type, :tags
    )
  end
end
