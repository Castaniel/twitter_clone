Rails.application.routes.draw do
  get 'tweets/new'

  get 'tweets/create'

  get 'tweets/update'

  get 'tweets/destroy'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'log_in' => 'sessions#new'
  delete 'log_out' => 'sessions#destroy'
  get 'sign_up' => 'users#new'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :tweets
  root 'home#index'
end
