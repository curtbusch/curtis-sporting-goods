class Category < ApplicationRecord
  has_many :products

  validates :category_name, presence: true

  def name
    return self.category_name
  end
end
