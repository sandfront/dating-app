Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get '/landing', to: 'pages#landing', as: :landing
  root to: 'pages#home'
  devise_for :users,
    skip: [ :sessions ],
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete "/users/sign_out", :to => "devise/sessions#destroy", as: :destroy_user_session
  end


  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end
  resources :profiles, only: [:show, :index, :edit, :update] do
    resources :user_images, only: [:show, :destroy, :update]
    resources :matches, only: [:create]
  end
  post 'users/:id/match', to: 'matches#create', as: :match
  mount ActionCable.server => "/cable"
end

