class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :verify_token, only: [ :create ]

  def create
    @user = User.new(user_params)
    if @user.save
      jti = SecureRandom.uuid
      @user.update(jti: jti)

      exp = (Time.now + 1.hour).to_i
      payload = { jti: jti, user_id: @user.id, exp: exp }
      token = JWT.encode(payload, Rails.application.credentials[:secret_key_base])

      render json: { token: token, user: { id: @user.id, email: @user.email } }, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
