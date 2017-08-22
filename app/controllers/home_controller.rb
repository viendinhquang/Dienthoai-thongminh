class HomeController < ApplicationController
  def index
    @categories = Category.all.includes(:sub_categories)
    @products = Product.all
  end
end
