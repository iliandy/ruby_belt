class User < ActiveRecord::Base
  has_many :shoes
  has_many :buys
  has_many :shoes_bought, through: :buys, source: :shoe

  has_secure_password
  email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: email_regex }
end
