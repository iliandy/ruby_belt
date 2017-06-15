class User < ActiveRecord::Base
  has_secure_password
  has_many :secrets
  has_many :likes
  has_many :secrets_liked, through: :likes, source: :secret

  email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, :birthdate, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: email_regex }
end
