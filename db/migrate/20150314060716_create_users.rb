class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :las_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email
  end
end