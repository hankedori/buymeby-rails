class Custom::UserRegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    super do |resource|
      SlackUserNotifier.send("A new user has signed up! Please welcome " + current_user.email + " to Buymeby. User id: " + current_user.id.to_s)
    end
  end
end
