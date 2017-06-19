class Shoe < ActiveRecord::Base
  belongs_to :user

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
