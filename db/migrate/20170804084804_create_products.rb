class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sub_category_id
      t.string :price
      t.string :made_in
      t.string :screen_size
      t.string :producer_id
      t.string :operating_system_id
      t.string :type_color_id

      t.timestamps null: false
    end
  end
end
