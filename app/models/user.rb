class User < ActiveRecord::Base
  has_secure_password

  email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, :alias, :birthdate, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: email_regex }
  validates :birthdate,
    date: { before: Proc.new { Time.now - 13.year }, message: "must be at least 13 years old" }, on: :create
end
