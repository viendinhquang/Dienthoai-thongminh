class PostRepliesController < ApplicationController
  def new
    # binding.pry
    @post_reply = PostReply.new
  end

  def create
    # @post_show = Post.find(params[:post_comment_id])
    # unless current_user.nil?
    #   @post_comment = PostComment.create(user_id: current_user.id, post_id: params[:post_comment][:post_id], content: params[:content])
    #   @post_comment.save
    #   flash[:success] = "Thank for your comment!"
    #   redirect_to post_path(@post_comment.post_id)
    # else
    #   flash[:danger] = "You must login"
    #   redirect_to :back
    # end
    unless current_user.nil?
      @reply = PostReply.create(post_comment_id: params[:post_comment_id], content: params[:content], user_id: current_user.id)
      @reply.save
      flash[:success] = "Thank for your comment!"
      redirect_to post_path(params[:post_id])
    else
      flash[:danger] = "You must login"
      redirect_to :back
    end
  end

  def index
  end
  def destroy
    PostReply.find(params[:id]).destroy
    flash[:success] = "Comment deleted!"
    redirect_to :back
  end
end
