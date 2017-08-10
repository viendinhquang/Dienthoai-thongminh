class CreatePostReplies < ActiveRecord::Migration
  def change
    create_table :post_replies do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post_comment, index: true, foreign_key: true
      t.string :content
      t.string :like

      t.timestamps null: false
    end
  end
end
