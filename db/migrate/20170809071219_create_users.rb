class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :birthday
      t.string :sex
      t.string :avatar

      t.timestamps null: false
    end
  end
end
