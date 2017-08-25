class PostController < ApplicationController
  def index
    @post = Post.order("created_at DESC").limit(5)
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
                 .order('created_at DESC')
  end
end
