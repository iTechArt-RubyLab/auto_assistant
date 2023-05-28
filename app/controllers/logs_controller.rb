class LogsController < ApplicationController
  before_action :set_log, only: %i[ edit update destroy ]

  #
  def index
    @logs = Log.all
  end

  def show
    @log = Log.find(params[:id])
    @car = @log.car
  end

  def new
    @car = Car.find(params[:car_id])
    @log = @car.build_log
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs or /logs.json
  def create
    @car = Car.find(params[:car_id])
    @log = @car.build_log(log_params)
    if @log.save
      Resque.enqueue(LogJob, current_user.id)
      redirect_to @car, notice: "Log was successfully created."
    else
      render :new
    end
  end
  def update
    respond_to do |format|
      if @log.update(log_params)
        LogJob.enqueue(current_user.id)

        format.html { redirect_to log_url(@log), notice: "Log was successfully updated." }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @log.destroy

    respond_to do |format|
      format.html { redirect_to logs_url, notice: "Log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_log
    @log = Log.find(params[:id])
  end

  def log_params
    params.require(:log).permit(
      :oil_change, :water_removal, :cabin_filter_change,
      :breaks_liquid_change, :freeze_liquid_change, :driving_belt_change,
      :chain_grm_change, :oil_filter_change, :air_filter_change,
      :registration_number, :ensuranse_expiration, :driver_lisence_expiration,
      :inspection, :car_id
    )
  end
end
