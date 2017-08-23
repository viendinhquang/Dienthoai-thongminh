class Admin::PostsController < ApplicationController
  before_action :logged_in_user
  # before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  def new
     @post = Post.new
  end
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 15)
                 .order('created_at asc')
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
    def logged_in?
      !current_user.nil?
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in..."
        redirect_to sign_in_path
      end
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
    def post_params
      params.require(:post).permit(:title, :content, :user_id, :sub_category_id)
    end
end
