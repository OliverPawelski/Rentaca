Rails.application.routes.draw do
  devise_for :users
  get "/about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :cars do
    get 'search', on: :collection
  end
  root to: "pages#home"
  get "/profile/:id", to: "pages#profile", as: :profile
  get "/user_cars", to: "cars#user_cars", as: "user_cars"
  get "/bookings", to: "pages#bookings"
  # Defines the root path route ("/")
end
