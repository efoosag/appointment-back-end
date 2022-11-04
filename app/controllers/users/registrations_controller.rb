# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'User is successfully signed up', data: resourse }
      }, status: :ok
    else
      render json: {
        status: { message: 'User could not be sign up', 
        error: resource.errors.full_message }, status: :Unprocessable entity
      }
    end
  end
end
