class PostController < ApplicationController
  before_filter :search
  def index
    @post = Post.order("created_at ASC").limit(4)
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
                 .order('created_at ASC')
  end
  def search
    # @q = Post.search(params[:q])
    @posts = @q.result
               .order('created_at DESC')
               .to_a.uniq
  end
  def introduce
  end
end
