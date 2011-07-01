class GemItem < ActiveRecord::Base

  validates_presence_of :name
  
  index do
    name
  end
  
  serialize :dependencies
  
  before_save :create_upgrade_notification
  
  scope :most_updated_gems, order('updated_at desc').limit(10)
  scope :most_subscribed_gems, order('subscribed_count desc').limit(10)
  
  def subscribers
    User.joins("join subscribes on subscribes.user_id = users.id").where("subscribes.gem_item_id = ?", self.id)
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
