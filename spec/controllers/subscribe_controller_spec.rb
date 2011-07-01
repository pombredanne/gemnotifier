require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SubscribeController do
  
  context "User Logged In" do
    
    before(:each) do
      @user = Factory(:user)
      @gem_item = Factory(:gem_item)
      controller.stub!(:current_user).and_return(@user)
    end
    
    describe "GET index" do
      
      it "should list gems user subscribed" do
        gem_items = [mock(GemItem), mock(GemItem)]
        @user.should_receive(:subscribed_gems).and_return(gem_items)
        get :index
        response.should be_success
        assigns[:gem_items].should == gem_items
      end
      
    end
    
    describe "POST create" do
      
      it "should subscribe the gem" do
        @user.subscribed?(@gem_item).should be_false
        post :create, :gem_id => @gem_item.id
        response.should be_success
        @user.subscribed?(@gem_item).should be_true
      end
      
    end
    
    describe "DELETE destroy" do
      
      before(:each) do
        Factory(:subscribe, :gem_item => @gem_item, :user => @user)
      end
      
      it "should unsubscribe the gem" do
        @user.subscribed?(@gem_item).should be_true
        delete :destroy, :gem_id => @gem_item.id
        response.should be_success
        @user.subscribed?(@gem_item).should be_false
      end
      
    end
    
    describe "GET with_gemfile" do
      
      it "should display gemfile upload page" do
        get :with_gemfile
        response.should be_success
      end
      
    end
    
    describe "POST select_gems" do
      
      before(:each) do
        @gemfile_content = """
        gem 'rails', '3.0.5'
        gem 'httparty'
        gem 'kaminari'
        """
      end
      
      it "should display gem list from gemfile" do
        post :select_gems, :gemfile_content => @gemfile_content
        assigns[:gems_to_subscribe].should_not be_empty
        response.should be_success
      end
      
      it "should redirect if can get gems from gemfile" do
        gemfile_parser = mock(GemfileParser, :errors => ['error'])
        gemfile_parser.should_receive(:parse)
        GemfileParser.should_receive(:parse).and_return(gemfile_parser)
        
        post :select_gems
        response.should redirect_to('/with_gemfile')
      end
      
    end
    
    describe "POST subscribe_gems" do
      
      it "should subscribe gems and redirect" do
        @user.subscribed?(@gem_item).should be_false
        
        post :subscribe_gems, :gems => [@gem_item.name]
        @user.subscribed?(@gem_item).should be_true
        flash[:notice].should == 'Successfully subscribed all gems in Gemfile!'
        response.should redirect_to('/')
      end
      
      it "should redirect with no gems subscribe" do
        post :subscribe_gems, :gems => []
        flash[:notice].should == 'No gems is selected.'
        response.should redirect_to('/')
      end
      
    end
    
  end
  
  context "User without log in" do
    
    it "should be redirect without login" do
      get :index
      flash[:error].should == "You need to signin with github to continue!"
      response.should redirect_to('/')
    end
    
  end
  
end