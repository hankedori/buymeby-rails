class Sellmeby::OrdersController < ApplicationController
  before_action :authenticate_vendor!

  def index
    @orders = current_vendor.orders.reserved
    @completed_orders = current_vendor.orders.completed
  end

  def update
    current_vendor.orders.find(params[:id]).complete!

    @orders = current_vendor.orders.reserved
    @completed_orders = current_vendor.orders.completed
  end
end
