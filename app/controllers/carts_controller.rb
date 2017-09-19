class CartsController < ApplicationController
  def show
    # binding.pry
    @order_items = current_order.order_items.paginate(:page => params[:page], :per_page => 5)
                                .order('created_at DESC')
  end
end
