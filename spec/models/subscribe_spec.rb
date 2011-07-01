require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Subscribe do
  
  it { should belong_to(:user) }
  it { should belong_to(:gem_item) }
  
  describe "#increase_subscribed_count" do
    
    before(:each) do
      @gem_item = Factory(:gem_item)
      @user = Factory(:user)
    end
    
    it "should increase the gem item subscribed count after a new subscribe" do
      @gem_item.subscribed_count.should == 0
      Subscribe.create({:user => @user, :gem_item => @gem_item})
      @gem_item.reload
      @gem_item.subscribed_count.should == 1
    end
    
  end
  
  describe "#decrease_subscribed_count" do
    
    before(:each) do
      @gem_item = Factory(:gem_item)
      @user = Factory(:user)
      @subscribe = Subscribe.create({:gem_item => @gem_item, :user => @current_user})
    end
    
    it "should decrease the subscribed count of gem item after a new unsubscribe" do
      @gem_item.reload
      @gem_item.subscribed_count.should == 1
      @subscribe.destroy
      @gem_item.reload
      @gem_item.subscribed_count.should == 0
    end
    
  end
  
  
end