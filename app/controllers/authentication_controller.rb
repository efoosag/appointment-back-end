class AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: [:login]

  def login
    @user = User.find_by(email: params[:email])
    if @user
      if(@user.authenticate(params[:password]))
        payload = {user_id: @user_id}
        secret = ENV['SECRET_BASE_KEY'] || Rails.application.secrets.secret_key_base
        token = create_token(payload)
        render json : { name: @user.name, }
      else
        render json: { message: "Authentication Failed"}
      end
    else
      render json: { message: "Could Not Find User"}
    end
  end
end
