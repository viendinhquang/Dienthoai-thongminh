class HomeController < ApplicationController
  def index
    @categories = Category.all.includes(:sub_categories)
  end
end
