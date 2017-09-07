Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get '/landing', to: 'pages#landing', as: :landing
  get '/about', to: 'pages#about', as: :about
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

  resources :communities, only: [:create]

  resources :profiles, only: [:show, :index, :edit, :update, :destroy] do
    resources :user_images, only: [:show, :destroy, :update, :edit]
    resources :matches, only: [:create]
    resources :dislikes, only: [:create]
    get '/onboard', to: 'profiles#onboard'
  end

  mount ActionCable.server => "/cable"
end

