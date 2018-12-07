# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/home'
  root 'pages#home'
  get 'pages/about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users , except: [:new]
  get 'login', to: 'sessionns#new'
  post 'login', to: 'sessionns#create'
  delete 'logout', to: 'sessionns#destroy'
  

end
