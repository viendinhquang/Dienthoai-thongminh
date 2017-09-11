class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 15)
                 .order('created_at DESC')
  end
  def show
    @post = Post.order("created_at DESC").limit(4)
    @post_show = Post.find(params[:id])
    # @post_comment = PostComment.create(user_id: current_user.id, post_id: params[:post_comment][:post_id], content: params[:content])
    # @post_comment.save
  end
end
