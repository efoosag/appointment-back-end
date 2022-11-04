Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create, :destroy, :show]
      resources :doctors, only: [:index, :create, :destroy, :show]
    end
  end
end
