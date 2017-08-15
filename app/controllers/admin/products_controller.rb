class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end
end
