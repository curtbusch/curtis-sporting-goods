class Product < ApplicationRecord
  belongs_to :category
  has_many :ordered_products
  has_many :orders, through: :ordered_products
end
