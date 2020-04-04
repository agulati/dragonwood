Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resource  :session, only: [:create]
      resources :codes,   only: [:index]
      resources :users,   only: [:create]
      resources :games,   only: [:create, :show] do
        resource :user,     only: [:show]
        resource :turn,     only: [:create]
        resource :discard,  only: [:create]
      end
    end
  end
end
