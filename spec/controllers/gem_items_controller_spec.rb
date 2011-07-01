require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GemItemsController do
  
  describe "GET show" do
    
    before(:each) do
      @gem_item = Factory(:gem_item)
    end
    
    it "should show gem profile" do
      get :show, :id => @gem_item.to_param
      response.should be_success
      assigns[:gem_item].should == @gem_item
    end
    
    it "should return 404 if gem_item cant be found" do
      get :show, :id => 'non-exist'
      response.should render_template("#{Rails.root}/public/404.html")
    end
    
  end
  
end