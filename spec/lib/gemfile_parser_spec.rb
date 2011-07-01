require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GemfileParser do
  
  describe "with invalid gemfile content" do
    
    before(:each) do
      invalid_gemfile_content = """
        gem 'foursquare2', git: 'git://github.com/CapnKernul/foursquare2.git'
      """
      @parser = GemfileParser.new(:gemfile_content => invalid_gemfile_content)
    end
    
    it "should return errors with invalid content" do
      @parser.parse
      @parser.errors.should_not be_empty
    end
    
  end
  
  describe "with valid gemfile content" do
    
    before(:each) do
      gemfile_content = """
        gem 'foursquare2'
      """
      @parser = GemfileParser.new(:gemfile_content => gemfile_content)
    end
    
    it "should parse the gemfile and return gems to subscribe" do
      @parser.parse
      @parser.errors.should be_empty
      @parser.gems_to_subscribe.should_not be_empty
    end
    
  end
  
end