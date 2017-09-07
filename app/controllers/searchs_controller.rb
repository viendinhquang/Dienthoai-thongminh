class SearchsController < ApplicationController
  def index
    # @q = Product.search(params[:q])
    @products = @q_product.result(distinct: true).paginate(:page => params[:page], :per_page => 12).includes(:type_colors)
                                                                         .order('created_at asc')
  end
end
