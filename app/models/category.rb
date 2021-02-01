class Category < ApplicationRecord
  belongs_to :list
  has_many :classification
  has_many :product, through: :classification

  validates :name, presence: true
end
