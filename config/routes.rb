Rails.application.routes.draw do
  devise_for :users
  root to: 'animals#index'
  resources :animals do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
end
