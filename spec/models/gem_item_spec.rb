require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GemItem do
  
  before(:each) do
  end
  
  it { should validate_presence_of(:name) }
  
  describe ".subscribers" do
  
    before(:each) do
      @gem_item = Factory(:gem_item)
      @user_a = Factory(:user)
      @user_b = Factory(:user)
      Factory(:subscribe, :user => @user_a, :gem_item => @gem_item)
      Factory(:subscribe, :user => @user_b, :gem_item => @gem_item)
    end
    
    it "should return all users that subscribed this gem item" do
      @gem_item.subscribers.should == [@user_a, @user_b]
    end
    
  end
  
  describe "#create_upgrade_notification" do
    
    before(:each) do
      @gem_item = Factory(:gem_item, :version => '1.0.0')
    end
    
    it "should create noitification when version changed" do
      @gem_item.version = '1.0.1'
      @gem_item.save
      Notification.where(:gem_item_id => @gem_item, :version => '1.0.1').first.should be_valid
    end
    
    it "should not create notification when version not changed" do
      @gem_item.name = 'abc'
      @gem_item.save
      Notification.where(:gem_item_id => @gem_item).first.should be_nil
    end
    
  end
  
  describe ".most_updated_gems" do
    
    it "should return top 10 latest updated gem item" do
      GemItem.most_updated_gems.order_values.should == ['updated_at desc']
      GemItem.most_updated_gems.limit_value.should == 10
    end
    
  end
  
  describe ".most_subscribed_gems" do
    
    it "should return top 10 most subscribed gem items" do
      GemItem.most_subscribed_gems.order_values.should == ['subscribed_count desc']
      GemItem.most_subscribed_gems.limit_value.should == 10
    end
    
  end
  
  describe "#to_param" do
    
    it "should return gem item name" do
      gem_item = Factory(:gem_item)
      gem_item.to_param.should == gem_item.name
    end
    
  end
  
end