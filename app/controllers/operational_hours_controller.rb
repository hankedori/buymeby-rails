class OperationalHoursController < ApplicationController
  before_action :set_operational_hour, only: [:show, :update, :destroy]

  # GET /operational_hours
  # GET /operational_hours.json
  def index
    @operational_hours = OperationalHours.all
  end

  # GET /operational_hours/1
  # GET /operational_hours/1.json
  def show
  end

  # POST /operational_hours
  # POST /operational_hours.json
  def create
    @operational_hour = OperationalHours.new(operational_hour_params)

    if @operational_hour.save
      render :show, status: :created, location: @operational_hour
    else
      render json: @operational_hour.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /operational_hours/1
  # PATCH/PUT /operational_hours/1.json
  def update
    if @operational_hour.update(operational_hour_params)
      render :show, status: :ok, location: @operational_hour
    else
      render json: @operational_hour.errors, status: :unprocessable_entity
    end
  end

  # DELETE /operational_hours/1
  # DELETE /operational_hours/1.json
  def destroy
    @operational_hour.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operational_hour
      @operational_hour = OperationalHours.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operational_hour_params
      params.fetch(:operational_hour, {})
    end
end
