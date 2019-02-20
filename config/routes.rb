Rails.application.routes.draw do
  resources :reviews
  resources :bookings
  get 'my_bookings' => 'bookings#my_bookings'
  get 'my_customers_booked' => 'bookings#my_customers_booked'
  get 'new_with_waitlist' => 'bookings#new_with_waitlist'
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
