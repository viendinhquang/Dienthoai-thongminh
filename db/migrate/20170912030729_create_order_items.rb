class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :name
      t.string :product_id
      t.string :order_id

      t.timestamps null: false
    end
  end
end
