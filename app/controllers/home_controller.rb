class HomeController < ApplicationController
  def index
    @products = Product.all.includes(:type_colors)
  end
end
