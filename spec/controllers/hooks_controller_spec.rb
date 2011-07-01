require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HooksController do
  
  describe "POST gems" do
    
    it "should create and save gem if gem in params not exist" do
      params = { 'name' => 'rspec', 'version' => '2.6.0'}
      GemItem.where(:name => params['name']).first.should be_nil
      post :gems, params
      response.should be_success
      GemItem.where(:name => params['name']).first.should_not be_nil
    end
    
    it "should update and gem if gem in params exist" do
      gem_item = Factory(:gem_item, :version => '1.0.1')
      post :gems, { 'name' => gem_item.name, 'version' => '1.0.2'}
      response.should be_success
      gem_item.reload
      gem_item.version.should == '1.0.2'
    end
    
  end
  
end