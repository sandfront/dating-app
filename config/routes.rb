Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users
  post 'users/:id/match', to: 'matches#create', as: :match
end
