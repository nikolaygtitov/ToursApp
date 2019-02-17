Rails.application.routes.draw do
  resources :tours
  get 'home/index'

  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
