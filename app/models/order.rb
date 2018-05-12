class Order < ApplicationRecord
  belongs_to :customer, required: false
  belongs_to :user, required: false
  belongs_to :product
  validates :amount, presence: true, numericality: { only_integer: true }
end
