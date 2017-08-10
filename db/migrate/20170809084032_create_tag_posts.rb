class CreateTagPosts < ActiveRecord::Migration
  def change
    create_table :tag_posts do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.string :category

      t.timestamps null: false
    end
  end
end
