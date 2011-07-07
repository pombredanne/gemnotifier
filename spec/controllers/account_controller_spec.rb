require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountController do
  
  describe "With user login" do
    
    before(:each) do
      @user = Factory(:user)
      session[:user_id] = @user
    end
    
    describe "GET show" do
      
      it "should show the user's profile" do
        get :show
        
        assigns[:user].should == @user
        response.should be_success
      end
      
    end
    
    describe "PUT update" do
      
      it "should update user info" do
        put :update, { 'user' => { 'name' => 'Test Foo' } }
        response.should redirect_to('/account')
        @user.reload
        @user.name.should == 'Test Foo'
      end
    end
    
  end
  
  describe "Without user login" do
    
    ['show', 'update'].each do |action|
      
      it "should be redirect with login when visit :#{action}" do
        get action.to_sym
        
        response.should redirect_to('/')
      end
      
    end
    
  end
  
end