class List < ApplicationRecord
  belongs_to :user
  has_many :product
  has_many :category
  has_one_attached :picture

  validates :title, presence: true
end
