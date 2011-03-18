class GemItem < ActiveRecord::Base
  
  serialize :dependencies
  
  before_save :create_upgrade_notification
  
  def subscribers
    User.joins("join subscribes on subscribes.user_id = users.id").where("subscribes.gem_item_id = ?", self.id)
  end
  
  protected
    
    def create_upgrade_notification
      if !self.new_record? && self.version_changed?
        Notification.create({:gem_item => self, :version => self.version, :upgraded_at => Time.now})
      end
    end
    
end
