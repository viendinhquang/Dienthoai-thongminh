class HomeController < ApplicationController
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 12).includes(:type_colors)
                                                                         .order('created_at asc')
  end
end
