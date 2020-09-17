Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buys, only: [:index, :new, :create]
  end
  resources :messages, only: [:new, :create]

end
