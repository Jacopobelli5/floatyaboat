Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/about', to: "pages#about"
  resources :boats do
    resources :bookings, only: [:new, :create, :edit]
    resources :reviews, only: [ :new, :create ]
  end
  resources :bookings, only: [:show]
end
