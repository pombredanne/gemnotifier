require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GemfileParser do
  
  describe "with invalid gemfile content" do
    
    before(:each) do
      @parser = GemfileParser.new({})
    end
    
    it "should return errors with invalid content" do
      invalid_gemfile_content = """
        gem 'foursquare2', git: 'git://github.com/CapnKernul/foursquare2.git'
      """
      @parser.gemfile_content = invalid_gemfile_content
      @parser.parse
      @parser.errors.should_not be_empty
    end
    
    it "should raise error if gem syntax is wrong" do
      gemfile_content = """
        gem :rspec
      """
      @parser.gemfile_content = gemfile_content
      @parser.parse
      @parser.errors.should == ["There's syntax error in gemfile"]
    end
    
    it "should raise error in gemfile content is not assigned" do
      @parser.gemfile_content.should be_nil
      @parser.gemfile_file.should be_nil
      @parser.parse
      @parser.errors.should_not be_empty
    end
    
    context "with invalid gemfile" do
      
      it "should raise error with invalid gemfile" do
        @parser.gemfile_file = File.new(File.join(Rails.root, 'spec/fixtures', 'invalid_Gemfile'))
        @parser.parse
        @parser.errors.should_not be_empty
      end
      
    end
    
  end
  
  describe "with valid gemfile content" do
    
    context "with content" do
      
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
    
    context "with Gemfile" do
      
      before(:each) do
        gemfile_file = File.new(File.join(Rails.root, 'spec/fixtures', 'Gemfile'))
        @parser = GemfileParser.new(:gemfile => gemfile_file)
      end
      
      it "should parse the gemfile correctly" do
        @parser.parse
        @parser.errors.should be_empty
        @parser.gems_to_subscribe.should_not be_empty
      end
      
    end
  end
  
end