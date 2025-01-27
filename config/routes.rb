Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root to: "posts#index"  # この1行を追加

      resources :posts, only: [ :index, :create, :destroy, :update, :show, :edit ]

      get "signup", to: "users#new"
      post "signin", to: "sessions#create"
      delete "signout", to: "sessions#destroy"
      resources :users, except: [ :new ]
    end
  end
end
