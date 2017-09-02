Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end
  resources :profiles, only: [:show, :index, :edit, :update] do
    resources :matches, only: [:create]
  end
  resources :user_images, only: [:show, :destroy, :update]
  get 'profiles/21/edit/photo/:photo_id', to: 'profiles#edit_photo', as: :edit_photo
  post 'users/:id/match', to: 'matches#create', as: :match
  mount ActionCable.server => "/cable"
end

