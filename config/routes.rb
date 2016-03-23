Rails.application.routes.draw do
  resources :dreams do
    member do
      put :like
      put :unlike
    end
  end
  resources :users, only: [] do
    get :toggle_stalk
  end

  root to: 'dreams#index'
  devise_for :users
end
