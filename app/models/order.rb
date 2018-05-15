class Order < ApplicationRecord
  belongs_to :table
  belongs_to :user, required: false
  belongs_to :product
  validates :amount, presence: true, numericality: { only_integer: true }
end
