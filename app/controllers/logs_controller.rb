class LogsController < ApplicationController
  before_action :set_log, only: %i[ edit update destroy ]

  # GET /logs or /logs.json
  #
  def index
    @logs = Log.all
  end

  # GET /logs/1 or /logs/1.json

  def show
    @log = Log.find(params[:id])
    @car = @log.car
  end

  # GET /logs/new
  def new
    @car = Car.find(params[:car_id])
    @log = @car.build_log
  end

  # GET /logs/1/edit
  def edit
    # @car = Car.find(params[:car_id])
    # @log = Log.find(params[:log_id])
  end

  # POST /logs or /logs.json
  def create
    @car = Car.find(params[:car_id])
    @log = @car.build_log(log_params)
    if @log.save
      # ExpiryNotificationWorkerJob.perform_in((@log.ensuranse_expiration - 1.month).beginning_of_day, @log.id)
      # ExpiryNotificationWorkerJob.perform_in((@log.driver_lisence_expiration - 1.month).beginning_of_day, @log.id)

      redirect_to @car, notice: "Log was successfully created."
    else
      render :new
    end
  end

  # def create
  #   @log = @car.build_log(log_params)
  #   if @log.save
  #     redirect_to car_log_path(@car, @log)
  #   else
  #     render :'cars/index'
  #   end
  # end
  # PATCH/PUT /logs/1 or /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        # ExpiryNotificationWorkerJob.perform_in((@log.ensuranse_expiration - 1.month).beginning_of_day, @log.id)
        # ExpiryNotificationWorkerJob.perform_in((@log.driver_lisence_expiration - 1.month).beginning_of_day, @log.id)

        format.html { redirect_to log_url(@log), notice: "Log was successfully updated." }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1 or /logs/1.json
  def destroy
    @log.destroy

    respond_to do |format|
      format.html { redirect_to logs_url, notice: "Log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_log
    @log = Log.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
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
