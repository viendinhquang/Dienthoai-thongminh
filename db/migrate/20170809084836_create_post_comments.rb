class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.string :content
      t.string :like

      t.timestamps null: false
    end
  end
end
