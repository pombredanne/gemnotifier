class ChangeAuthUidType < ActiveRecord::Migration
  def self.up
    change_column :authorizations, :uid, :integer
  end

  def self.down
    change_column :authorizations, :uid, :string
  end
end