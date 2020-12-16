Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  get 'homes/index'
  get "tweets/search"
  root to: 'homes#index'
  resources :users do
    get :following, :followers, :user_tweets
  end
  resources :relationships, only: [:create, :destroy]
  resources :data, only: :index
  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end

end
