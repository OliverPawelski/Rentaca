Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  get "/about", to: "pages#about"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :bookings do
    member do
      patch :accept
      patch :decline
      get :accept
      get :decline
    end
  end
  resources :users do
    delete :destroy, on: :member
  end
  resources :cars do
    get 'search', on: :collection
    get "get_daily_rate", on: :member
  end
  root to: "pages#home"
  get "/profile/:id", to: "pages#profile", as: :profile
  get "/user_cars", to: "cars#user_cars", as: "user_cars"
  get "/bookings", to: "pages#bookings"
  get "/admin_dashboard", to: "pages#admin_dashboard"
end
