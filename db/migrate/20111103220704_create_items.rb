class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.boolean :tradeable
      t.boolean :sellable
      t.date :date
      t.integer :collection_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
