class Product < ApplicationRecord
  belongs_to :category
  # has_many :ordered_products
  # has_many :orders, through: :ordered_products, dependent: :destroy
  # accepts_nested_attributes_for :category, allow_destroy: true

  validates :name, :description, :price, :quantity, :category_id, presence: true

  mount_uploader :image, ImageUploader

  def self.search(search)
    @product = if search
                 Product.where('name LIKE :search OR description LIKE :search',
                               search: "%#{search}%")
               else
                 Product.all
               end
  end
end
