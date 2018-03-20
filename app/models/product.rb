class Product < ApplicationRecord
  belongs_to :category
  has_many :ordered_products
  #has_many :orders, through: :ordered_products

  #accepts_nested_attributes_for :category, allow_destroy: true
end
