class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   binding.pry
  #   user = User.find_by_email(params[:user][:email])
  #   if user && user.authenticate(params[:user][:password])
  #     log_in user
  #     flash[:success] = 'Login success'
  #     redirect_to admin_page_index_path
  #     # redirect_to root_path
  #   else
  #     flash[:danger] = 'Invalid email/password combination'
  #     render 'new'
  #   end
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   binding.pry
  #   redirect_to admin_page_index_path
  #   # super
  # end

  # def create
  #   user = User.find_by(email: params[:session][:email])
  #   if user && user.authenticate(params[:session][:password])
  #     log_in user
  #     flash[:success] = 'Login success'
  #     redirect_to root_path
  #   else
  #     flash[:danger] = 'Invalid email/password combination'
  #     render 'new'
  #   end
  # end
  # def destroy
  #   log_out
  #   redirect_to login_path
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   binding.pry
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
