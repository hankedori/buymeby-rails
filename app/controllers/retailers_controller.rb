class RetailersController < ApplicationController
  before_action :set_retailer, only: [:show, :update, :destroy]

  # GET /retailers
  # GET /retailers.json
  def index
    @retailers = Retailer.all
  end

  # GET /retailers/1
  # GET /retailers/1.json
  def show
  end

  # POST /retailers
  # POST /retailers.json
  def create
    @retailer = Retailer.new(retailer_params)
    if operational_hours_params.present?
      @retailer.operational_hours.new(operational_hours_params)
    else
      @retailer.operational_hours.new
    end

    if @retailer.save
      render :show, status: :created
    else
      render json: @retailer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /retailers/1
  # PATCH/PUT /retailers/1.json
  def update
    if @retailer.update(retailer_params)
      render :show, status: :ok
    else
      render json: @retailer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /retailers/1
  # DELETE /retailers/1.json
  def destroy
    @retailer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retailer
      @retailer = Retailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retailer_params
      params.require(:retailer).permit(:name, :description, :latitude, :longitude)
    end

    def operational_hours_params
      params.require(:retailer).permit(:operational_hours).permit(:type, :open, :close)
    end
end
