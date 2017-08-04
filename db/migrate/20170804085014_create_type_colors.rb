class CreateTypeColors < ActiveRecord::Migration
  def change
    create_table :type_colors do |t|
      t.string :System
      t.string :name

      t.timestamps null: false
    end
  end
end
