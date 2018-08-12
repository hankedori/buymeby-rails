class Sellmeby::VendorsController < ApiController
  before_action :authenticate_vendor!

  def show
  end

  def update
    if current_vendor.update(vendor_params)
      render :show, status: :ok
    else
      render json: current_vendor.errors, status: :unprocessable_entity
    end
  end

  def update_hours
    hours = OperationalHours.collection_from_day_array params[:days]

    if current_vendor.update_hours hours
      render :show, status: :ok
    else
      render json: hours.errors, status: :unprocessable_entity
    end
  end

  def vendor_params
    params.permit(:place_id, :latitude, :longitude, :address, :description)
  end

  def hour_params
    params.permit({ days: [] })
  end
end
