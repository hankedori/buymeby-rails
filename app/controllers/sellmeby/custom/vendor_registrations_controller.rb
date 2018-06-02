class Sellmeby::Custom::VendorRegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    super do |resource|
      SlackVendorNotifier.send("A new vendor has signed up! Please welcome " + current_vendor.name + " to Buymeby. Vendor id: " + current_vendor.id.to_s + ", email: " + current_vendor.email)
    end
  end
end
