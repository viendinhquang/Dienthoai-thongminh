class PostCommentsController < ApplicationController
  def new
    @post_comment = PostComment.new
  end
  def create
    @post_comment = PostComment.create(user_id: current_user.id, post_id: params[:post_comment][:post_id], content: params[:content])
    @post_comment.save
    redirect_to post_path(@post_comment.post_id)
  end
  def index
    @post_comments = PostComment.all
  end
  def show

  end
  def destroy
    binding.pry
  end

  # private
  # def post_comment_params
  #   params.require(:post_comment).permit(:name, :email)
  # end
end
