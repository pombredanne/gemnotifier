class Subscribe < ActiveRecord::Base
  belongs_to :user
  belongs_to :gem_item
  
  after_create :increase_subscribed_count
  
  before_destroy :decrease_subscribed_count
  
  protected
    
    def increase_subscribed_count
      self.gem_item.update_attribute(:subscribed_count, self.gem_item.subscribed_count + 1)
      GemItem.update(self.gem_item_id, :subscribed_count => (self.gem_item.subscribed_count + 1))
    end
    
    def decrease_subscribed_count
      GemItem.update(self.gem_item_id, :subscribed_count => (self.gem_item.subscribed_count - 1))
    end
    
end
