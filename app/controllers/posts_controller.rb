class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 15)
                 .order('created_at desc')
  end
  def show
    @post = Post.order("created_at DESC").limit(4)
    @post_show = Post.find(params[:id])
  end
end
