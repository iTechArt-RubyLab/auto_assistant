class WorksController < InheritedResources::Base

  def index
    @works = Work.all
    @works = @works.where(car_id: params[:car_id]) if params[:car_id].present?
    @works = @works.where("service_name ILIKE ?", "%#{params[:service_name]}%") if params[:service_name].present?
    super
  end

  def new
    @user_cars = current_user.cars
    @work = Work.new
    super
  end

  def create
    @work = Work.new(work_params)
    car = Car.find(params[:work][:car_id])
    if car.log
      log = car.log
      field_value = params[:work][:service_work].gsub(/\s+/, "")
      if log.respond_to?(field_value)
        # new_value = params[:work][:next_appointment]
        new_value = 1.year.from_now
        log[field_value] = new_value



        if @work.save
          log.save
          user_id = current_user.id
          Resque.enqueue(NotificationJob, user_id, @work.id)
        end
      else
        @work.save
      end

    end
    super
  end

  private

  def work_params
    params.require(:work).permit(:car_id, :service_work, :next_appointment, :service_name)
  end

end
