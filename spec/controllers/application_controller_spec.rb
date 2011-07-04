require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationController do
  
  controller do
    def index
      render :nothing => true
    end
  end
  
  before(:each) do
    @user = Factory(:user)
  end
  
  it "should return user with login" do
    session[:user_id] = @user.id
    get :index
    response.should be_success
    controller.send(:current_user).should == @user
    controller.send(:signed_in?).should be_true
  end
  
  it "should return nil without login" do
    get :index
    response.should be_success
    controller.send(:current_user).should == nil
    controller.send(:signed_in?).should be_false
  end
  
end