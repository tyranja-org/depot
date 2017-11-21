class StoreController < ApplicationController
  def index
    @session_count = increment_count
    @products = Product.order(:title)
  end

  private
  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1
  end
end
