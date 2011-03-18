class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.integer :gem_item_id
      t.string :version
      t.datetime :upgraded_at

      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
