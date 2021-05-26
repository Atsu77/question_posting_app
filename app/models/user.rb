class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, length: { maximum: 15 }
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: {minimum:6}
end
