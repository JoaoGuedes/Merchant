class ChangeEmailToUnique < ActiveRecord::Migration
  def up
    change_column(:users, :email, :string, :unique => 'true')
  end

  def down
  end
end
