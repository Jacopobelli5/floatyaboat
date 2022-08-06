Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :boats do
    resources :bookings
  end
  resources :bookings, only: [:show] # localhost:3000/bookings/1/show
end
