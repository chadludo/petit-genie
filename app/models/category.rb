class Category < ApplicationRecord
  belongs_to :list
  has_many :classification, dependent: :destroy
  has_many :product, through: :classification, dependent: :destroy

  validates :name, presence: true
end
