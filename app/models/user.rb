class User < ActiveRecord::Base
  has_many :authorizations
  
  def subscribed_gems
    GemItem.joins("join subscribes on subscribes.gem_item_id = gem_items.id").where("subscribes.user_id = ?", self.id).order("subscribes.created_at desc")
  end
  
  def subscribed?(gem_item)
    Subscribe.where(:gem_item_id => gem_item.id, :user_id => self.id).first.present?
  end
  
  def notifications
    Notification.joins("join gem_items on gem_items.id = notifications.gem_item_id").joins("join subscribes on subscribes.gem_item_id = notifications.gem_item_id").where("notifications.created_at between :start_time and :end_time", {:start_time => Time.now.yesterday, :end_time => Time.now}).where("subscribes.user_id = ?", self.id)
  end
  
  def subscribe_gems(gems)
    gem_items = GemItem.where(:name => gems)
    gem_items.each do |gem_item|
      unless user.subscribed?(gem_item)
        Subscribe.create({:gem_item => gem_item, :user => self})
      end
    end
  end
  
end
