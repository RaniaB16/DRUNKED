Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  resources :parties
  resources :beverages
  resources :friendships, only: [:new, :destroy]
  get "/friendships/:id", to: "friendships#destroy"
  get "/add_friends", to: "friendships#add_friends"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
