Rails.application.routes.draw do
  resources :bookings
  get 'my_bookings' => 'bookings#my_bookings'
  resources :tours
  resources :tours do
    member do
      patch :cancel_tour
      put :cancel_tour
    end
  end
  get 'home/index'

  devise_for :users
  resources :users
  get 'my_customers' => 'users#my_customers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
