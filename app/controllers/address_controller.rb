class AddressController < ApplicationController
  def new
    @user = User.find(session[:user])
    @provinces = Province.all
  end

  def add_to_db
    @address = Address.create(address_name: params[:address],
                              postal_code: params[:postal_code],
                              city: params[:city],
                              userid: session[:user],
                              province: params[:province])

    @order = Order.create(total: Product.find(session[:cart_items]).sum(:price) * 1 +
        Province.find(id: params[:province]).first.gst +
        Province.find(id: params[:province]).first.pst,
                          session: session[:user])

    ordered_product = OrderedProduct.new
    ordered_product.product = Product.find(session[:cart_items])
    ordered_product.product = @order
    ordered_product.price = Product.find(session[:cart_items]).price
    ordered_product.quantity = 1
    ordered_product.save
  end
end
