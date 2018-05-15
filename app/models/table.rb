class Table < ApplicationRecord
  belongs_to :user, required: false
  has_many :orders
end
