class Shoe < ActiveRecord::Base
  belongs_to :user
  has_one :buy
  has_one :buyer, through: :buy, source: :user

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
