class User < ApplicationRecord
  before_create :set_jti

  has_secure_password
  has_many :posts

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }

  private

  def set_jti
    self.jti = SecureRandom.uuid
  end
end
