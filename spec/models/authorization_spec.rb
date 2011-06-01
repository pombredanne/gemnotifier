require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Authorization do
  
  it "should belongs to user"
  
  it "should be invalid without user_id"
  it "should be invalid without uid"
  it "should be invalid without provider"
  
  it "should be uniqe with uid in provider scope"
  
  describe ".from_auth" do
    
    it "should authorization with provider, uid"
    
  end
  
  describe ".create_from_auth" do
    
    it "should create user, authorization with params"
    
  end
  
end