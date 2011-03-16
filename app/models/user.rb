class User < ActiveRecord::Base
  has_many :authorizations
  
  def subscribed_gems
    GemItem.joins("join subscribes on subscribes.gem_item_id = gem_items.id").where("subscribes.user_id = ?", self.id)
  end
  
end
