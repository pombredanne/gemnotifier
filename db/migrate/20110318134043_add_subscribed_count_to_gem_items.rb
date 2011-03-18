class AddSubscribedCountToGemItems < ActiveRecord::Migration
  def self.up
    add_column :gem_items, :subscribed_count, :integer, :default => 0
  end

  def self.down
    remove_column :gem_items, :subscribed_count
  end
end
