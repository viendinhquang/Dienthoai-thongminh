class ProductCommentsController < ApplicationController
  def new
    @product_comment = ProductComment.new
  end

  def create
    # binding.pry
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

  def edit
    @product_comment = ProductComment.find(params[:id])
  end
  def update
    # binding.pry
    @product_comment = ProductComment.find(params[:id])
    if @product_comment.update_attributes(content: params[:content])
        flash[:success] = "Comment updated!"
        redirect_to product_path(@product_comment.product_id)
      else
        render 'edit'
      end
  end

  def destroy
    ProductComment.find(params[:id]).destroy
    flash[:success] = "Comment deleted!"
    redirect_to :back
  end
end
