Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
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

  resources :cars do
    get 'log', on: :member
  end


  root "cars#index"
  get '/my_cars', to: 'cars#my_cars', as: 'my_cars'


end
