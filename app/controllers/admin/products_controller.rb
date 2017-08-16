class Admin::ProductsController < ApplicationController
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
                       .order('created_at asc')
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
    redirect_to :back
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :made_in, :screen_size)
    end
end
