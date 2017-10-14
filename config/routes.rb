Rails.application.routes.draw do



  devise_for :users
  resources :listings
  resources :conversations, only: [:index, :show, :new]
  resources :messages, only: [:create]

  get '/support' => 'support#new'
  post '/support' => 'support#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
