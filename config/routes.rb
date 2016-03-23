Rails.application.routes.draw do
  resources :dreams do
    member do
      put :like
      put :unlike
    end
  end
  resources :users, only: [] do
    get :stalk
    get :unstalk
  end

  root to: 'visitors#index'
  devise_for :users
end
