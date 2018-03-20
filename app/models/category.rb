class Category < ApplicationRecord
  has_many :products

  def name
    return self.category_name
  end
end
