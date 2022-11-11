class ApplicationController < ActionController::API
  before_action :authenticate
  
  def authenticate
    if request.headers["Authorization"]
      begin
        auth_header = request.headers["Authorization"]
        decoded_token = JWT.decode(token, secret)
        payload = decoded_token.first
        user_id = payload["user_id"]
        @user = User.find(user_id)
      rescue 
        render json: { message: "Error: #{excrption}" }, status: :forbidden
      end  
    else 
      render json: { message: "No Authorization Header Sent" }, status: :forbidden 
    end
  end

  def create_token(payload)
    JWT.encode(payload, secret)
  end
  
  private

  def secret
    secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
  end

  def token
    auth_header.split(" ")[1]
  end 
end
