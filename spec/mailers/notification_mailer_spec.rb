require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NotificationMailer do
  
  describe "upgrades" do
    
    before(:each) do
      @user = Factory(:user)
      @notification = Factory(:notification)
      @mail = NotificationMailer.upgrades(@user, [@notification])
    end
    
    it "should send to user's mail" do
      @mail.to.should == [@user.email]
    end
    
    it "should have subject" do
      @mail.subject.should == 'GemNotifier + Updates'
    end
    
    it "should include gems upgrade info in body" do
      @mail.encoded.should match(@notification.gem_item.name)
      @mail.encoded.should match(@notification.version)
    end
    
  end
  
end