class Critery < ApplicationRecord
  has_one :user
  validates :grease, :proteins, :calories, :carbohydrates, :numericality => {:greater_than => 0}
end