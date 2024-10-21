class AuthController < ApplicationController
  skip_before_action :authorize_request, only: [:register, :login]

  def register
    user = User.create!(user_params)
    render json: { message: 'User created successfully' }, status: :created
  end

  def login
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      token = encode_token(user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
