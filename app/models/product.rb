class Product < ApplicationRecord
  belongs_to :list
  has_many :classification, dependent: :destroy
  has_many :category, through: :classification, dependent: :destroy
  has_one_attached :picture, dependent: :destroy
end
