class ProductCommentsController < ApplicationController
  def new
    @product_comment = ProductComment.new
  end

  def create
    unless current_user.nil?
      @product_comment = ProductComment.create(user_id: current_user.id, product_id: params[:product_comment][:product_id], content: params[:content])
      @product_comment.save
      flash[:success] = "Thank for your comment!"
      redirect_to product_path(@product_comment.product_id)
    else
      flash[:danger] = "You must login"
      redirect_to :back
    end
  end
end
