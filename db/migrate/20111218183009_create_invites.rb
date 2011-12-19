class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.column :user_id, :integer, :null => false           # source of the relationship
      t.column :user_id_target, :integer, :null => false    # target of the relationship
      t.column :code, :string                                 # random invitation code
      t.column :message, :text                                # invitation message
      t.column :is_accepted, :boolean
      t.column :accepted_at, :timestamp                       # when did they accept?
      t.timestamps
    end
  end
end
