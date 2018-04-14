class Sellmeby::OrdersController < ApplicationController
  before_action :authenticate_vendor!

  def index
    @orders = current_vendor.orders.all
  end

  def update
    @order = current_vendor.orders.find params[:id]
    @order.complete!
    @orders = current_vendor.orders.all
  end
end
