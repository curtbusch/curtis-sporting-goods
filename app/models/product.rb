class Product < ApplicationRecord

  belongs_to :category
  #has_many :ordered_products
  #has_many :orders, through: :ordered_products

  #accepts_nested_attributes_for :category, allow_destroy: true
  validates :name, :description, :price, :quantity, :category_id, :on_sale, presence: true

  def self.search(search)
    if search
      @products = Product.where("name LIKE :search OR description LIKE :search", search: "%#{search}%")
    else
      @products = Product.all
    end
  end


end
