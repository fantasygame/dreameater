Rails.application.routes.draw do
  resources :dreams
  root to: 'visitors#index'
  devise_for :users
end
