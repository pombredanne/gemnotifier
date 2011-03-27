class Authorization < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  
  def self.from_auth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end
  
  def self.create_from_auth(auth)
    user = User.create!({
      :name => auth['user_info']['name'],
      :email => auth['user_info']['email'],
      :nickname => auth['user_info']['nickname']
    })
    Authorization.create({
      :provider => auth['provider'],
      :uid => auth['uid'],
      :user_id => user.id
    })
  end
  
end
