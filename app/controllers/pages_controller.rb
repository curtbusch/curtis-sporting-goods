class PagesController < ApplicationController
  def show
    @page = Page.find(params[:page])
  end
end
