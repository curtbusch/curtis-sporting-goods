class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_products, dependent: :destroy
  has_many :products, through: :ordered_products

  validates :total, :userId, presence: true
end
