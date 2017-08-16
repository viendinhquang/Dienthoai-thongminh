class ChangeProductPhoto < ActiveRecord::Migration
  def change
    rename_column :type_colors, :product_photo, :picture
  end
end
