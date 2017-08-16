class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    @user.save
    redirect_to admin_users_path
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
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "User updated!"
        redirect_to  admin_users_path
      else
        render 'edit'
      end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted!"
    redirect_to :back
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :birthday, :sex, :password, :password_confirmation, :avatar)
    end
end
