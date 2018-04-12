class AddressController < ApplicationController
  def new
    @user = User.find(session[:user])
    @provinces = Province.all
  end
end
