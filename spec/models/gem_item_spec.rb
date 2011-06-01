require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GemItem do
  
  before(:each) do
  end
  
  it "should have a valid name" do
  end
  
  it "should not be valid without name"
  
  describe ".subscribers" do
  
    it "should return all users that subscribed this gem item"
    
  end
  
  describe "#create_upgrade_notification" do
    
    it "should create noitification when version changed"
    
    it "should not create notification when version not changed"
    
  end
  
  describe ".most_updated_gems" do
    
    it "should return top 10 latest updated gem item"
    
  end
  
  describe ".most_subscribed_gems" do
    
    it "should return top 10 most subscribed gem items"
    
  end
  
  describe "#to_param" do
    
    it "should return gem item name"
    
  end
  
end