Rails.application.routes.draw do
  resources :doctors
  resources :users
  get '/current_user_details', to: 'current_user#index'

  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create, :destroy, :show]
      resources :doctors, only: [:index, :create, :destroy, :show]
    end
  end
end
