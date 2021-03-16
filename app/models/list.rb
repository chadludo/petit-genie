class List < ApplicationRecord
  belongs_to :user
  has_many :product, dependent: :destroy
  has_many :category, dependent: :destroy
  has_one_attached :picture, dependent: :destroy

  validates :title, presence: true
  validates :birth_date, presence: true
end
