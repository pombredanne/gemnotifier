class GemItem < ActiveRecord::Base
  
  serialize :dependencies
  
  before_save :create_upgrade_notification
  
  def subscribers
    User.joins("join subscribes on subscribes.user_id = users.id").where("subscribes.gem_item_id = ?", self.id)
  end
  
  def self.most_updated_gems
    GemItem.order('updated_at desc').limit(5)
  end
  
  def self.most_subscribed_gems
    GemItem.order('subscribed_count desc').limit(5)
  end
  
  def to_param
    self.name
  end
  
  protected
    
    def create_upgrade_notification
      if !self.new_record? && self.version_changed?
        Notification.create({:gem_item => self, :version => self.version, :upgraded_at => Time.now})
      end
    end
    
end
