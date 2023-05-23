class WorksController < InheritedResources::Base

  private

    def work_params
      params.require(:work).permit(:car_id, :service_work, :next_appointment)
    end

end
