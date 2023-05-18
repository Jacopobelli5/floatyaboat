Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/about', to: "pages#about"
  resources :boats do
    resources :bookings, only: %i[new create edit]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: [:show]
end
