class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :update, :destroy]

  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Vendor.all
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
  end

  # POST /vendors
  # POST /vendors.json
  def create
    @vendor = Vendor.new(vendor_params)
    if operational_hours_params.present?
      @vendor.operational_hours.new(operational_hours_params)
    else
      @vendor.operational_hours.new
    end

    if @vendor.save
      render :show, status: :created
    else
      render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vendors/1
  # PATCH/PUT /vendors/1.json
  def update
    if @vendor.update(vendor_params)
      render :show, status: :ok
    else
      render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(:name, :description, :latitude, :longitude)
    end

    def operational_hours_params
      params.require(:vendor).permit(:operational_hours).permit(:type, :open, :close)
    end
end
