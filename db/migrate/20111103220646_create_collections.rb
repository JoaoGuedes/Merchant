class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title
      t.string :description
      t.boolean :visibility
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
