class Sellmeby::OrdersController < ApiController
  before_action :authenticate_vendor!

  def index
    @orders = current_vendor.orders.reserved
    @completed_orders = current_vendor.orders.completed + current_vendor.orders.cancelled
  end

  def update
    current_vendor.orders.find(params[:id]).complete!

    @orders = current_vendor.orders.reserved
    @completed_orders = current_vendor.orders.completed
  end
end
