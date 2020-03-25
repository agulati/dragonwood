Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resource :session, only: [:create]
      resources :games, only: [:create, :show] do
        resource :user, only: [:show]
      end
      resources :users, only: [:create]
    end
  end
end
