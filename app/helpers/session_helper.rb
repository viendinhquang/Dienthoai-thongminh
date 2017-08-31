module SessionHelper
  def log_in(user)
    session[:user_id]= user.id
  end
   # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

   # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to sign_in_path
    end
  end

  def admin_user
    unless current_user.admin?
      flash[:danger] = "You must be admin!!!"
      redirect_to(root_url)
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:danger] = "Not your account"
      redirect_to(root_url)
    end
  end
  # def correct_user
  #   binding.pry
  #   @user = User.find(params[:id])
  #   if @user.admin?
  #     flash[:danger] = "Not your account"
  #     redirect_to(root_url) unless @user == current_user
  #   end
  # end
   # def current_user
   #    binding.pry
   #    @current_user = @current_user || User.find_by(id: session[:user_id])
   # end

end
