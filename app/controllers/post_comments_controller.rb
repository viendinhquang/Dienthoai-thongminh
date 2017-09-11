class PostCommentsController < ApplicationController
  def new
    @post_comment = PostComment.new
  end
  def create
    # binding.pry
    unless current_user.nil?
      @post_comment = PostComment.create(user_id: current_user.id, post_id: params[:post_comment][:post_id], content: params[:content])
      @post_comment.save
      flash[:success] = "Thank for your commit!"
      redirect_to post_path(@post_comment.post_id)
    else
      flash[:danger] = "You must login"
      redirect_to :back
    end
  end
  def index
    binding.pry
    @post_comments = PostComment.all.order('created_at DESC')
  end
  def edit
    # binding.pry
    @post_comment = PostComment.find(params[:id])
    # redirect_to post_path(@post_comment.post_id)
  end
  def update
    # binding.pry
    @post_comment = PostComment.find(params[:id])
    if @post_comment.update_attributes(content: params[:content])
        flash[:success] = "Comment updated!"
        redirect_to post_path(@post_comment.post_id)
      else
        render 'edit'
      end

  end
  def show

  end
  def destroy
    PostComment.find(params[:id]).destroy
    flash[:success] = "Comment deleted!"
    redirect_to :back
  end

  # private
  # def post_comment_params
  #   params.require(:post_comment).permit(:name, :email)
  # end
end
