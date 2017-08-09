class CreateProductComments < ActiveRecord::Migration
  def change
    create_table :product_comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.string :content
      t.string :like

      t.timestamps null: false
    end
  end
end
