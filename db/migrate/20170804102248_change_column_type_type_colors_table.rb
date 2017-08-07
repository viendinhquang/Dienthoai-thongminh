class ChangeColumnTypeTypeColorsTable < ActiveRecord::Migration
  def change
    rename_table :operateing_systems, :operating_systems
    #refactor product model
    remove_column :products, :sub_category_id
    remove_column :products, :operating_system_id
    remove_column :products, :producer_id
    remove_column :products, :type_color_id

    add_column :products, :sub_category_id, :integer
    add_column :products, :operating_system_id, :integer
    add_column :products, :producer_id, :integer
    add_foreign_key :products, :producers
    add_foreign_key :products, :operating_systems
    add_foreign_key :products, :sub_categories

    #refactor type_colors table
    remove_column :type_colors, :System
    add_column    :type_colors, :color_code, :string
    add_column    :type_colors, :product_photo, :string
    add_column    :type_colors, :product_id, :integer

    add_foreign_key :type_colors, :products
  end
end
