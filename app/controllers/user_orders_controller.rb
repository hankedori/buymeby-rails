class UserOrdersController < ApplicationController
  before_action :authenticate_member!

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.includes(:vendor_orders, :vendors, :order_details).find(params[:id])
  end
end
