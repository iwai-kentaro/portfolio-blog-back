Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root to: 'posts#index'  #この1行を追加

      resources :posts, only: [:index, :create, :destroy, :update, :show, :edit] 
    end
  end
end
