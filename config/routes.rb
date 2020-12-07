Rails.application.routes.draw do
  get 'home/index'
  get "home/show"
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
  root to: 'home#index'
  #get 'home/index'
  #root to: "infos#index"
  resources :users
  resources :tweets 
  resources :infos, only: :index

end
