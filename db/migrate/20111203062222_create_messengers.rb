class CreateMessengers < ActiveRecord::Migration
  def change
    create_table :messengers do |t|
      t.integer :user_from
      t.integer :user_to
      t.string :title
      t.string :body
      t.boolean :read
      t.datetime :date

      t.timestamps
    end
  end
end
