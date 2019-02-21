Rails.application.routes.draw do
  resources :reviews
  get 'show_tour_review' => 'reviews#show_tour_review'
  resources :bookings
  get 'my_bookings' => 'bookings#my_bookings'
  get 'my_customers_booked' => 'bookings#my_customers_booked'
  get 'my_customers_bookmarked' => 'bookings#my_customers_bookmarked'
  get 'new_with_waitlist' => 'bookings#new_with_waitlist'
  get 'bookmark' => 'bookings#bookmark'
  get 'customer_bookmarks' => 'bookings#customer_bookmarks'
  get 'agent_bookmarks' => 'bookings#agent_bookmarks'
  resources :tours
  resources :tours do
    resources :reviews, except: [:show, :index]
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
