class History < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :order
end
