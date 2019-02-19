Rails.application.routes.draw do
  get 'reviews/create'
  devise_for :users
  root to: 'animals#index'
  resources :animals do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:create]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
