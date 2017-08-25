class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user
  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Account was successfully created."
      redirect_to admin_users_path
    else
      flash.now[:danger] = 'Invalid email/password combination.'
      render 'new'
    end
  end
  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
                 .order('created_at asc')
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    binding.pry
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "User updated!"
        redirect_to  admin_users_path
      else
        render 'edit'
      end
  end
  def destroy
    binding.pry
    User.find(params[:id]).destroy
    flash[:success] = "User deleted!"
    redirect_to admin_users_path
  end

  private
  # def logged_in?
  #   !current_user.nil?
  # end

  # def logged_in_user
  #   unless logged_in?
  #     flash[:danger] = "Please log in..."
  #     redirect_to sign_in_path
  #   end
  # end
  # def admin_user
  #   redirect_to(root_url) unless current_user.admin?
  # end
  # def correct_user
  #   @user = User.find(params[:id])
  #   if @user.admin?
  #     redirect_to(root_url) unless @user == current_user
  #   end
  # end

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :sex, :password, :password_confirmation, :avatar, :remove_avatar, :password_digest)
  end
end
