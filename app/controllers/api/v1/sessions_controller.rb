class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_token, only: [ :create ]

  def create
    user = User.find_by(email: params[:email])

    # ユーザーが見つかり、認証が成功した場合
    if user&.authenticate(params[:password])
      jti = user.jti
      exp = (Time.now + 1.hour).to_i
      payload = { jti: jti, user_id: user.id, exp: exp }
      token = JWT.encode(payload, Rails.application.credentials[:secret_key_base])

      # トークンを返す
      render json: { token: token }, status: :ok
    else
      # 認証失敗時のレスポンス
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    @current_user.update(jti: SecureRandom.uuid)
    render json: { message: "Logged out" }, status: :ok
  end
end
