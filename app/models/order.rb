class Order < ApplicationRecord
  belongs_to :table, required: false
  belongs_to :user, required: false
  belongs_to :product
  has_many :histories
  validates :amount, presence: true, numericality: { only_integer: true }
end
