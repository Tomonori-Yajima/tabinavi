Rails.application.routes.draw do
  get 'users/new'
  root 'home_pages#home'
  get '/signup',  to:'users#new'
  get '/login',   to:'home_pages#login'
  get '/search',  to:'home_pages#search'
  resources :users
end
