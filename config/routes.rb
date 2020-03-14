Rails.application.routes.draw do
  root 'site#index'

  namespace :api do
    resources :games, only: [:new, :create, :show]
  end
end
