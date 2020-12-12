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
  get 'home/index'
  root to: 'home#index'
  resources :users
  resources :data, only: :index
  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end

end
