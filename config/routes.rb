Rails.application.routes.draw do
  get 'log_in' => 'sessions#new'
  delete 'log_out' => 'sessions#destroy'
  get 'sign_up' => 'users#new'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :tweets
  resources :relationships, only: [:create, :destroy]
  
  root 'home#index'
end
