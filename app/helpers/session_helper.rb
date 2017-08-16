module SessionHelper
   # Returns true if the user is logged in, false otherwise.
   def logged_in?
      !current_user.nil?
   end

   def log_out
      session.delete(:user_id)
      @current_user = nil
   end

   # Confirms a logged-in user.
   def logged_in_user
      binding.pry
      unless logged_in?
         flash[:danger] = "Please log in."
         redirect_to login_url
      end
   end

end
