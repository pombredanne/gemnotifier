require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  
  it { should have_many(:authorizations) }
  
  before(:each) do
    @user = Factory(:user)
    @gem_item = Factory(:gem_item)
  end
  
  describe ".subscribed_gems" do
    
    before(:each) do
      Subscribe.create({:user => @user, :gem_item => @gem_item})
    end
    
    it "should return all gems that user subscribed" do
      @user.subscribed_gems.should == [@gem_item]
    end
    
  end
  
  describe "#subscribed?" do
    
    before(:each) do
      @gem_item_1 = Factory(:gem_item)
      @gem_item_2 = Factory(:gem_item)
      Subscribe.create({:user => @user, :gem_item => @gem_item_1})
    end
    
    it "should return true if user subscribe the gem item" do
      @user.subscribed?(@gem_item_1).should be_true
    end
    
    it "should return false if user not subscribe the gem item" do
      @user.subscribed?(@gem_item_2).should be_false
    end
    
  end
  
  describe "#notifications" do
    
    before(:each) do
      Subscribe.create({:user => @user, :gem_item => @gem_item})
      @notification = Factory(:notification, :gem_item => @gem_item, :version => '1.0.0', :upgraded_at => Time.now)
    end
    
    it "should return notfications when gems user subscribed get a new version for past day" do
      @user.notifications.should == [@notification]
    end
    
  end
  
  describe "#subscribe_gems" do
    
    it "should subscribe all specify gems" do
      @user.subscribed?(@gem_item).should be_false
      @user.subscribe_gems([@gem_item.name])
      @user.subscribed?(@gem_item).should be_true
    end
    
  end
  
end