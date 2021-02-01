class Product < ApplicationRecord
  belongs_to :list
  has_many :classification
  has_many :category, through: :classification
  has_one_attached :picture
end
