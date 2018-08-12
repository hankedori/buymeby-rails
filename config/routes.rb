Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resource :api do
    resources :discounts
    resources :operational_hours
    resources :user_orders do
      put 'cancel', to: 'user_orders#cancel'
    end
    resources :vendors do
      resources :items
      post 'add_inventory', to: 'vendors#add_inventory'
      post 'block', to: 'vendors#block'
    end
    post 'populate_cart' => "cart#populate"
    post 'place_order' => "cart#order"
    resource :sellmeby do
      scope module: 'sellmeby' do
        post 'upload_logo' => "logos#upload"
        post 'update_hours' => "vendors#update_hours"
        resource :vendors
        resources :items
        resources :orders
      end
    end
    post 'activate_vendor' => "admin_actions#activate_vendor"
    post 'deactivate_vendor' => "admin_actions#deactivate_vendor"
  end
  mount_devise_token_auth_for 'User', at: 'api/auth', controllers: {
    :registrations => "custom/user_registrations"
  }
  mount_devise_token_auth_for 'Vendor', at: 'api/sellmeby/auth', controllers: {
    :registrations => "sellmeby/custom/vendor_registrations"
  }
end
