Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :profiles, only: [:show, :index, :edit]
  post 'users/:id/match', to: 'matches#create', as: :match
end
