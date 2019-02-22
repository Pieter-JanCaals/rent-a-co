Rails.application.routes.draw do
  # get 'reviews/create'
  devise_for :users
  root to: 'animals#index'
  get 'users/owner', to: 'users#become_owner', as: 'owner'
  post 'bookings/:id', to: 'bookings#confirm_booking', as: 'booking_respond'
  resources :animals do
    resources :bookings, only: [:create, :update]
    resources :reviews, only: [:create]
  end
  resources :bookings, only: [:index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
