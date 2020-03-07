Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  root "users#index"
  resources :users, only: [:edit, :update, :index] 
  resources :groups, only: [:new, :create, :edit, :update, :show] do
  resources :messages, only: [:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
end
