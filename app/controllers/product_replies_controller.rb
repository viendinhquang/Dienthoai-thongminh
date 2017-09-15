class ProductRepliesController < ApplicationController
  def new
  end

  def create
    binding.pry
    unless current_user.nil?
      @product_reply = ProductReply.create(user_id: current_user.id, product_comment_id: params[:product_comment][:product_id], content: params[:content])
      @product_reply.save
      flash[:success] = "Thank for your reply!"
      # redirect_to product_path(@product_reply.product_id)
    else
      flash[:danger] = "You must login"
      redirect_to :back
    end
  end

  def index
  end
end
