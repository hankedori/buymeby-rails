class Sellmeby::PushController < ApiController
  before_action :authenticate_vendor!

  def create
    current_vendor.update! device_token: token_params
  end

  private

  def token_params
    params.permit(:token).fetch(:token)
  end
end
