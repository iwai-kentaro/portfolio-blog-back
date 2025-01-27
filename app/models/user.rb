class User < ApplicationRecord
  before_create :set_jti

  has_secure_password
  has_many :posts

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { maximum: 50 }

  private

  def set_jti
    self.jti = SecureRandom.uuid
  end
end
