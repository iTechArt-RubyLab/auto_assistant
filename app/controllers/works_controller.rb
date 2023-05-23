class WorksController < InheritedResources::Base
  def new
    @user_cars = current_user.cars
    @work = Work.new
    super
  end

  private

    def work_params
      params.require(:work).permit(:car_id, :service_work, :next_appointment)
    end

end
