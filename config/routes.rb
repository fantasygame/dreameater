Rails.application.routes.draw do
  resources :dreams
  resources :users, only: [] do
    get :stalk
  end

  root to: 'visitors#index'
  devise_for :users
end
