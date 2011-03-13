class ChangeGemItemsAuthorsType < ActiveRecord::Migration
  def self.up
    change_column :gem_items, :authors, :text
  end

  def self.down
    change_column :gem_items, :authors, :string
  end
end