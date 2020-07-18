Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :destroy]
      resources :banks, only: [:create, :update, :show]
      post '/login', to: 'auth#login'
    end
  end
end