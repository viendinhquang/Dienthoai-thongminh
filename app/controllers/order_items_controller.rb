class OrderItemsController < ApplicationController
  before_action :logged_in_user
  def create
    # binding.pry
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    existing_order = @order.order_items.where(product_id: params[:order_item][:product_id])
    if existing_order.count >= 1
      existing_order.last.update_column(:quantity, existing_order.last.quantity.to_i + params[:order_item][:quantity].to_i)
    else
      @order.save
    end
    session[:order_id] = @order.id
    flash[:success] = "It was added to your cart successfully!!!"
    redirect_to cart_path
  end

  def update
    # binding.pry
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    flash[:success] = "Your cart was updated"
    redirect_to cart_path
  end

  def destroy
    # binding.pry
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    flash[:danger] = "Successfully deleted"
    redirect_to :back
  end

  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
