Rails.application.routes.draw do
  devise_for :users
  root to: 'animals#index'
  resources :animals do
    resources :reviews, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
