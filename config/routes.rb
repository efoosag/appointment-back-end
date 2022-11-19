# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users

  namespace :api do
    namespace :v1 do
      resources :reservations, only: %i[index create destroy show]
      resources :doctors, only: %i[index create destroy show]
    end
  end
end
