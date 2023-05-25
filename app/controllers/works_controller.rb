class WorksController < InheritedResources::Base
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
      field_value = params[:work][:service_work]
      log.water_removal = nil
      if field_value in log:
        new_value = params[:work][:next_appointment]
        log.water_removal = 1.year.from_now
        # p log[field_value] + "68686868686958"
        # log.params[:work][:service_work] = params[:work][:next_appointment]

        # log.water_removal = params[:work][:next_appointment]

        if @work.save
          log.save
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
