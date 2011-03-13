class ChangeGemItemsInfoType < ActiveRecord::Migration
  def self.up
    change_column :gem_items, :info, :text
  end

  def self.down
    change_column :gem_items, :info, :string
  end
end