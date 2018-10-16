class Sellmeby::PushController < ApiController
  before_action :authenticate_vendor!

  def create
    current_vendor.update! device_token: token_params, device_os: os_params
  end

  private

  def token_params
    params.permit(:token).fetch(:token)
  end

  def os_params
    params.permit(:os).fetch(:os)
  end
end
