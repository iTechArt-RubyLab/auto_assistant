Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  as :user do
    get 'login_admin', to: 'devise/sessions#new'
  end
  resources :logs
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "cars#index"
  resources :cars
  resources :logs
  root "cars#index"
  get '/my_cars', to: 'cars#my_cars', as: 'my_cars'


end
