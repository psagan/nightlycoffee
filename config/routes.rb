Rails.application.routes.draw do
  get '/backend', to: 'backend#index', as: 'backend'
  resources :articles
  resources :tags
  devise_for :users, controllers: { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'home#index'
end
