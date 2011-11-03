class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      t.string :about
      t.string :email
      t.string :password
      t.integer :photo_id

      t.timestamps
    end
  end
end
