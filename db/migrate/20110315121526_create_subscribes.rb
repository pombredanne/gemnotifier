class CreateSubscribes < ActiveRecord::Migration
  def self.up
    create_table :subscribes do |t|
      t.integer :gem_item_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subscribes
  end
end
