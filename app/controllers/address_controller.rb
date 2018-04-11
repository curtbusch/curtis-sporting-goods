class AddressController < ApplicationController
  def new
    @user = User.find(session[:user])
  end
end
