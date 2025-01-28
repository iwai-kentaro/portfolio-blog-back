Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # 投稿関連のAPI
      resources :posts, only: [ :index, :create, :destroy, :update, :show, :edit ]

      resources :users, except: [ :new ]
      # ユーザー登録
      post "registrations", to: "registrations#create"

      ## ユーザー認証
      # ログイン
      post "signin", to: "sessions#create"
      # ログアウト
      delete "signout", to: "sessions#destroy"
    end
  end
end
