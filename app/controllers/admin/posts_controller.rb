class Admin::PostsController < ApplicationController
  before_action :logged_in_user
  # before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  def new
     @post = Post.new
  end
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 15)
                 .order('created_at desc')
  end
  def create
    @post = Post.create(post_params)
    @post.save
    redirect_to admin_posts_path
  end
  def show
    @post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
      if @post.update_attributes(post_params)
        flash[:success] = "Post updated!"
        redirect_to  admin_posts_path
      else
        render 'edit'
      end
  end
  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted!"
    redirect_to admin_posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :user_id, :category_id, :image)
    end
end
