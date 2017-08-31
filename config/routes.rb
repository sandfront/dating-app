Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :conversations, only: [:show] do
    resources :messages, only: [:create]
  end
  resources :profiles, only: [:show, :index, :edit, :update] do
    resources :matches, only: [:create]
  end
  post 'users/:id/match', to: 'matches#create', as: :match
  mount ActionCable.server => "/cable"
end

