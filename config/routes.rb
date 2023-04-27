Rails.application.routes.draw do
  resources :services
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  ActiveAdmin.routes(self)
  as :user do
    get 'login_admin', to: 'devise/sessions#new'
  end
  # resources :logs

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :cars do
    resource :log, only: [:show, :new, :create, :edit, :update, :destroy]
    get 'log', on: :member
  end
  resources :logs
  resources :services
  root "cars#index"

end
