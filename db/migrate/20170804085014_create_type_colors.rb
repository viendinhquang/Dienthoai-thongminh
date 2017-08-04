class CreateTypeColors < ActiveRecord::Migration
  def change
    create_table :type_colors do |t|
      t.string :color_code
      t.string :name
      t.string :product_photo

      t.timestamps null: false
    end
  end
end
