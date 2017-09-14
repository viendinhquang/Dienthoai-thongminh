class ProductController < ApplicationController
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 10)
                 .order('created_at ASC')
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    @product_show = Product.find(params[:id])
  end
end
