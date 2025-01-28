class ApplicationController < ActionController::API
  before_action :verify_token

  private

  def verify_token
    token = extract_token_from_header
    return unless token

    decoded = decode_token(token)
    return unless decoded

    user = find_user(decoded["user_id"])
    return unless user

    validate_jti(decoded["jti"], user.jti)
  end

  def extract_token_from_header
    authorization_header = request.headers["Authorization"]
    if authorization_header.blank?
      render_error("Authorization header is missing", :unauthorized)
      return
    end

    token = authorization_header.split(" ")[1]
    if token.blank?
      render_error("Token is missing", :unauthorized)
      return
    end

    token
  end

  def decode_token(token)
    begin
      JWT.decode(token, Rails.application.credentials[:secret_key_base])[0]
    rescue JWT::DecodeError => e
      render_error("JWT decode error: #{e.message}", :unauthorized)
      nil
    end
  end

  def find_user(user_id)
    user = User.find_by(id: user_id)
    unless user
      render_error("Invalid user", :unauthorized)
      return
    end

    @current_user = user
  end

  def validate_jti(decoded_jti, user_jti)
    if decoded_jti != user_jti
      render_error("Invalid token", :unauthorized)
      nil
    end
  end

  def render_error(message, status)
    render json: { error: message }, status: status
  end
end
