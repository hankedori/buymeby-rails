class UserOrdersController < ApplicationController
  before_action :authenticate_member!

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.includes(:vendor_orders, :vendors, :order_details).find(params[:id])
  end

  def cancel
    @vendor_order = current_user.vendor_orders.find(params[:user_order_id])
    @vendor_order.cancel!
    @order = @vendor_order.user_order
  end
end
