
Rails.application.routes.draw do
   resources :users 
  post '/auth/login', to: 'authentication#login'

  namespace :api do
    namespace :v1 do
      resources :reservations, only: %i[index create destroy show]
      resources :doctors, only: %i[index create destroy show]
    end
  end
end
