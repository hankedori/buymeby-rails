Rails.application.routes.draw do
  resource :api do
    resources :discounts
    resources :operational_hours
    resources :user_orders
    resources :vendors do
      resources :items
      post 'add_inventory', to: 'vendors#add_inventory'
    end
    post 'populate_cart' => "cart#populate"
    post 'place_order' => "cart#order"
  end
  mount_devise_token_auth_for 'User', at: 'api/auth'
  mount_devise_token_auth_for 'Vendor', at: 'api/vendor_auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
