Rails.application.routes.draw do
  devise_for :users
  resources :games
  get '/history', to: 'games#history'
  get '/log', to: 'games#new'
  root 	to: 'home#index'
end
