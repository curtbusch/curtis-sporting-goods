class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_shopping_cart

  def index
    if(!params.has_key?(:category_id) || params[:category_id] == '8')
      @products = Product.search(params[:search]).order(:name).page(params[:page]).per(5)
    else
      @products = Product.where(category_id: params[:category_id]).search(params[:search]).order(:name).page(params[:page]).per(5)
    end

    if(params.has_key?(:filter))
      if(params[:filter] == 'sale')
        @products = @products.where(on_sale: true)
      else
        @products = @products.where("created_at > ?", 7.days.ago)
      end
    end

    if(params.has_key?(:category_index))
      @products = Product.where(category_id: params[:category_index]).order(:name).page(params[:page]).per(5)
    end
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
