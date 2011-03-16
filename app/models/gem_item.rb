class GemItem < ActiveRecord::Base
  
  serialize :dependencies
  
  def subscribers
    User.joins("join subscribes on subscribes.user_id = users.id").where("subscribes.gem_item_id = ?", self.id)
  end
  
end
