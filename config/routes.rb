Rails.application.routes.draw do
  resources :users
  
  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create, :destroy, :show]
      resources :doctors, only: [:index, :create, :destroy, :show]
    end
  end
end
