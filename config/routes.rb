Rails.application.routes.draw do
  resources :users
  post '/login', to: 'authentication#login'
  
  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create, :destroy, :show]
      resources :doctors, only: [:index, :create, :destroy, :show]
    end
  end
end
