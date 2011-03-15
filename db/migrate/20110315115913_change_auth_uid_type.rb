class ChangeAuthUidType < ActiveRecord::Migration
  def self.up
    drop_table :authorizations
    create_table :authorizations do |t|
      t.string :provider
      t.integer :uid
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :authorizations
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id

      t.timestamps
    end
  end
end