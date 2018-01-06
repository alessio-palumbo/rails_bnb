Rails.application.routes.draw do
  root 'listings#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :profiles
  resources :listings
  resources :conversations, only: %i[index show new]
  resources :messages, only: %i[new create]

  get '/support' => 'support#new'
  post '/support' => 'support#create'

  get 'bookings/new' => 'bookings#new', as: 'new_booking'
  post 'bookings' => 'bookings#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
