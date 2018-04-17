class CategoriesController < ApplicationController
  def index
    @categories = Category.where.not(id: 8)
  end
end
