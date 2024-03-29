class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 25 }
  validates :firstname, presence: true
  validates :lastname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
