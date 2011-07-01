require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Authorization do
  
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:provider) }
  
  describe ".from_auth" do
    
    it "should authorization with provider, uid" do
      auth = Factory(:authorization)
      Authorization.from_auth({'provider' => auth.provider, 'uid' => auth.uid}).should == auth
    end
    
  end
  
  describe ".create_from_auth" do
    
    it "should create user, authorization with params" do
      Authorization.create_from_auth({
        'user_info' => {
          'name' => 'Demo',
          'email' => 'test@foo.com',
          'nickname' => 'rociiu'
        },
        'uid' => '12345',
        'provider' => 'github'
      })
      User.last.name.should == 'Demo'
      User.last.email.should == 'test@foo.com'
      Authorization.last.uid.should == 12345
      Authorization.last.provider.should == 'github'
    end
    
  end
  
end