Rails.application.routes.draw do
  root 'home_pages#home'
  get '/signup',  to:'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/search',  to:'home_pages#search'
  resources :users
end
