class User < ApplicationRecord
  has_secure_password

  validates :email, presence: { message: "Email field is blank" }
  validates :email, uniqueness: { message: "This email is already taken" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "email non-valid" }
end
