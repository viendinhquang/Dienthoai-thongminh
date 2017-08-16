class Admin::TypeColorsController < ApplicationController
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
  end
  def show
    @type_color = TypeColor.find(params[:id])
  end
  def edit
    @type_color = TypeColor.find(params[:id])
  end
  def update
    binding.pry
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
    redirect_to :back
  end

  private
    def type_color_params
      params.require(:type_color).permit(:name, :color_code, :product_id, :picture)
    end
end
