class Admin::TypeColorsController < ApplicationController
  before_action :logged_in_user
  # before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  # validates_processing_of :picture
  # validate :picture_size_validation

  def new
    @type_color = TypeColor.new
  end
  def create
    @type_color = TypeColor.create(type_color_params)
    @type_color.save
    redirect_to admin_type_colors_path
  end
  def index
    @type_colors = TypeColor.paginate(:page => params[:page], :per_page => 10)
                            .order('created_at asc').includes(:product)
  end
  def show
    @type_color = TypeColor.find(params[:id])
  end
  def edit
    @type_color = TypeColor.find(params[:id])
  end
  def update
    @type_color = TypeColor.find(params[:id])
      if @type_color.update_attributes(type_color_params)
        flash[:success] = "Type Color updated!"
        redirect_to  admin_type_colors_path
      else
        render 'edit'
      end
  end
  def destroy
    TypeColor.find(params[:id]).destroy
    flash[:success] = "Type Color deleted!"
    redirect_to admin_type_colors_path
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
    def type_color_params
      params.require(:type_color).permit(:name, :color_code, :product_id, :picture, :remove_picture)
    end
end
