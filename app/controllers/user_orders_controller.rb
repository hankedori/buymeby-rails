class UserOrdersController < ApplicationController
  before_action :authenticate_member!

  def index
    @orders = current_user.orders
  end
end
