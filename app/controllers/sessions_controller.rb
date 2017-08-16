class SessionsController < Devise::SessionsController
    def new
      get_pre_login_url
      super
    end
    def create
      # binding.pry
      @referer_url = root_path
      super
    end
    def destroy
      # binding.pry
      @referer_url = root_path
      super
    end
    private
    def current_user
      binding.pry
    @current_user = @current_user || User.find_by(id: session[:user_id])
  end
  def logged_in?
      binding.pry
    !current_user.nil?
  end

    def get_pre_login_url
      @referer_url = root_path
    end
    def after_sign_in_path_for resource
      sign_in_url = url_for(action: "new", controller: "sessions", only_path: false, protocol: "http")
      if @referer_url == sign_in_url
      super
    else
      @referer_url || root_path
    end
    end
  end