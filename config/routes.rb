Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  resources :parties
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
