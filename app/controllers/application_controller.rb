class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :init_variable
  after_filter :store_location
  include SessionHelper
  # def user_is_logged_in
  #   if !session[:current_user]
  #       redirect_to login_path
  #   end
  # end
  def init_variable
    @categories = Category.all.includes(:sub_categories)
  end

  def store_location
  # store last url as long as it isn't a /users path
    # binding.pry
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

#   def store_location
#   # store last url - this is needed for post-login redirect to whatever the user last visited.
#   return unless request.get?
#   if (request.path != "/users/sign_in" &&
#       request.path != "/users/sign_up" &&
#       request.path != "/users/password/new" &&
#       request.path != "/users/password/edit" &&
#       request.path != "/users/confirmation" &&
#       request.path != "/users/sign_out" &&
#       !request.xhr?) # don't store ajax calls
#     session[:previous_url] = request.fullpath
#   end
# end

  def after_sign_in_path_for(resource)
    # binding.pry
    request.referrer || admin_root_path
    # session.fetch 'user_return_to', admin_root_path
    # request.env['omniauth.origin'] || stored_location_for(resource) || root_url
  end

  # def after_sign_in_path_for(resource)
  #   if request.path == "/users/sign_in"
  #     request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  #   else
  #     request.env['omniauth.origin'] || stored_location_for(resource) || admin_page_index_path
  #   end
  # end

  # def after_sign_in_path_for(resource)
  #   binding.pry
  #   stored_location_for(resource) || admin_page_index_path
  # end
  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    sign_in_path
  end
  # def after_sign_out_path_for(resource)
  #   request.referrer || root_path
  # end
end
