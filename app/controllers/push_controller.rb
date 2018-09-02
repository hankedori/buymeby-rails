class PushController < ApiController
  before_action :authenticate_member!

  def create
    current_user.update! device_token: token_params
  end

  private

  def token_params
    params.permit(:token).fetch(:token)
  end
end
