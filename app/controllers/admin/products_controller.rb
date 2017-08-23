class Admin::ProductsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  def new
    @product = Product.new
  end
  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to admin_products_path
  end
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 10)
                       .order('created_at asc').includes(:type_colors)
  end
  def show
    @product = Product.find(params[:id])
  end
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
      if @product.update_attributes(product_params)
        flash[:success] = "Product updated!"
        redirect_to  admin_products_path
      else
        render 'edit'
      end
  end
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted!"
    redirect_to admin_products_path
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
    def product_params
      params.require(:product).permit(:name, :price, :made_in, :screen_size, :color)
    end
end
