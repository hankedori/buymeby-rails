Rails.application.routes.draw do
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
  end
  mount_devise_token_auth_for 'User', at: 'api/auth'
  mount_devise_token_auth_for 'Vendor', at: 'api/sellmeby/auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
