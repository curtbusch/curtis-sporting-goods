class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_shopping_cart

  def index
    @products = Product.search(params[:search]).page(params[:page]).per(5)
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
end
