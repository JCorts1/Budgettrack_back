class ApplicationController < ActionController::API
  before_action :authorize_request

  def encode_token(user_id)
    JWT.encode({ user_id: user_id }, Rails.application.secrets.secret_key_base)
  end

  def current_user
    @current_user ||= User.find(decoded_token[0]['user_id']) if decoded_token
  end

  private

  def authorize_request
    render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, Rails.application.secrets.secret_key_base)
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def auth_header
    request.headers['Authorization']
  end
end
