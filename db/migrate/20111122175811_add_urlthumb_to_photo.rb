class AddUrlthumbToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :url_thumb, :string
  end
end
