Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :create, :destroy, :update, :show, :edit] 
    end
  end
end
