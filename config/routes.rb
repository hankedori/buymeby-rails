Rails.application.routes.draw do
  resource :api do
    resources :discounts
    resources :operational_hours
    resources :retailers do
      resources :items
    end
  end
  mount_devise_token_auth_for 'User', at: 'api/auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
