class AdminActionsController < ApplicationController
  def activate_vendor
    @vendor = Vendor.find vendor_id
    @vendor.active!
    SlackVendorNotifier.send(@vendor.name + " activated!")
  end

  def deactivate_vendor
    @vendor = Vendor.find vendor_id
    @vendor.inactive!
    SlackVendorNotifier.send(@vendor.name + " deactivated :(")
  end

  def vendor_id
    params[:text].split(/\s*,\s*/).first
  end
end
