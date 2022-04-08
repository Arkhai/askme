require 'openssl'

# Валидация пользователя, связи, создание зашифрованного пароля
class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest.new('SHA256')

  attr_accessor :password

  has_many :questions, dependent: :destroy

  before_save :encrypt_password, :username_email_downcase

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^\s]+\z/ }
  validates :username, presence: true, uniqueness: true, length: { in: 2..40 }, format: { with: /\A[a-zA-Z_\d]+\z/ }
  validates :style, format: { with: /\A#[a-f\d]{6}\z/i }, allow_nil: true

  validates :password, presence: true, on: :create
  validates_confirmation_of :password

  def self.hash_to_string(password_hash)
    password_hash.unpack1('H*')
  end

  def self.authenticate(email, password)
    user = find_by(email: email&.downcase)
    return nil unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )

    return user if user.password_hash == hashed_password

    nil
  end

  private

  def username_email_downcase
    username&.downcase!
    email&.downcase!
  end

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )

    end
  end
end
