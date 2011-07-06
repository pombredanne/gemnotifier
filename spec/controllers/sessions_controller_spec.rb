require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SessionsController do
  
  before(:each) do
    @auth = Factory(:authorization)
    @user = @auth.user
  end
  
  describe "POST create" do
    
    context "exist user" do
      
      before(:each) do
        request.env['omniauth.auth'] = {
          'provider' => 'github',
          'uid' => @auth.uid
        }
      end

      it "should login user in" do
        get :create, :provider => 'github'
        response.should redirect_to('/')
        assigns[:auth].should == @auth
        session[:user_id].should == @user.id
      end
      
    end
    
    context "new user" do
      
      before(:each) do
        request.env['omniauth.auth'] = {
          'provider' => 'github',
          'uid' => 321123,
          'user_info' => {
            'name' => 'foo',
            'email' => 'test@foo.com',
            'nickname' => 'foofoo'
          }
        }
      end
      
      it "should create new auth, user and log user in" do
        get :create, :provider => 'github'
        response.should redirect_to('/')
        new_auth = Authorization.last
        new_user = User.last
        assigns[:auth].should == new_auth
        session[:user_id].should == new_user.id
      end
      
    end
    
  end
  
  describe "POST destroy" do
    
    before(:each) do
      session[:user_id] = @user
    end
    
    it "should sign user out" do
      delete :destroy
      session[:user_id].should be_nil
      response.should redirect_to('/')
    end
    
  end
  
end