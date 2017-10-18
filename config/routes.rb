Rails.application.routes.draw do
<<<<<<< HEAD
  root 'listings#index'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :profiles
=======
  resources :profiles
  root 'listings#index'

  devise_for :users
>>>>>>> c752caf0e27d5615318b44df51409a55ae3cede3
  resources :listings
  resources :conversations, only: [:index, :show, :new]
  resources :messages, only: [:new, :create]

  get '/support' => 'support#new'
  post '/support' => 'support#create'

  get 'bookings/new' => 'bookings#new', as: 'new_booking'
  post 'bookings' => 'bookings#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
