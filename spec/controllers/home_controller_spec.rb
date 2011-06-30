require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  
  describe "GET index" do
    
    before(:each) do
      @most_updated_gems = [mock(GemItem), mock(GemItem)]
      @most_subscribed_gems = [mock(GemItem), mock(GemItem)]
      GemItem.should_receive(:most_updated_gems).and_return(@most_updated_gems)
      GemItem.should_receive(:most_subscribed_gems).and_return(@most_subscribed_gems)
    end
    
    it "should display most updated and subscribed gems" do
      get :index
      response.should be_success
      assigns[:most_subscribed_gems].should == @most_subscribed_gems
      assigns[:most_updated_gems].should == @most_updated_gems
    end
    
  end
  
  describe "GET search" do
    
    it "should able to search for gems" do
      get :search, :query => 'a'
      response.should be_success
      assigns[:gem_items].should_not be_nil
    end
    
  end
  
  describe "GET browse" do
    
    it "should able to browse gems" do
      get :browse, :order => 'name'
      response.should be_success
      assigns[:gem_items].should_not be_nil
    end
    
  end
  
end