class Admin::UsersController < ApplicationController
  # before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update, :destroy]
  # before_action :admin_user, only: :destroy
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
    # authorize! :destroy, @user
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "User updated!"
        redirect_to  admin_users_path
      else
        flash[:danger] = "Check your email/password again!"
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

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :sex, :password, :password_confirmation, :avatar, :remove_avatar, :password_digest)
  end
end
