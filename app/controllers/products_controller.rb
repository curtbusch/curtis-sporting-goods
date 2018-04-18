class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_shopping_cart

  def index
    load_by_category_search

    load_by_filter if params.key?(:filter)

    load_by_category
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i

    session[:cart_items] << id unless session[:cart_items].include?(id)
    redirect_to products_path
  end

  def load_shopping_cart
    @cart_items = Product.find(session[:cart_items])
  end

  private

  def initialize_session
    session[:cart_items] ||= []
    session[:user] = User.first.id
  end

  def load_by_category
    @products = category_index if params.key?(:category_index)
  end

  def load_by_filter
    @products = if params[:filter] == 'sale'
                  @products.where(on_sale: true)
                else
                  @products.where('created_at > ?', 7.days.ago)
                end
  end

  def load_by_category_search
    @products = if !params.key?(:category_id) || params[:category_id] == '8'
                  none_category
                else
                  some_category
                end
  end

  def none_category
    Product.search(params[:search]).page(params[:page]).per(5)
  end

  def some_category
    Product.where(category_id: params[:category_id])
           .search(params[:search])
           .page(params[:page]).per(5)
  end

  def category_index
    Product.where(category_id: params[:category_index])
           .order(:name).page(params[:page]).per(5)
  end
end
