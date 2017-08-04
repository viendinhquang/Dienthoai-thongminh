class CreateOperateingSystems < ActiveRecord::Migration
  def change
    create_table :operateing_systems do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
