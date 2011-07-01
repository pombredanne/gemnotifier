class GemfileParser
  
  attr_accessor :errors, :gemfile_file, :gemfile_content, :gems_to_subscribe
  
  VERSION_REGEXP = /^(['"])([~><=]*)\s*(.+?)\1$/
  GEMNAME_REGEXP = /gem\s(['"])(.+?)\1/
  
  def self.parse(params)
    parser = GemfileParser.new(params)
    parser
  end
    
  def initialize(params)
    @gemfile_file = params[:gemfile]
    @gemfile_content = params[:gemfile_content]
    @errors = []
    @gems_to_subscribe = []
  end
  
  def parse
    if @gemfile_file.blank? && @gemfile_content.blank?
      @errors << "Must select Gemfile or paste Gemfile content."
    end
    parse_with_gemfile_file if @gemfile_file
    parse_with_gemfile_content if @gemfile_content
  end
  
  def parse_with_gemfile_file
    return if @gemfile_file.nil?
    gemfile_string = @gemfile_file.read
    parse_with_gemfile_string(gemfile_string)
  rescue
    @errors << "Can't parse the Gemfile"
  end
  
  def parse_with_gemfile_content
    return if @gemfile_content.nil?
    parse_with_gemfile_string(@gemfile_content)
  rescue
    @errors << "Can't parse the Gemfile"
  end
  
  def parse_with_gemfile_string(gemfile_string)
    gem_strings = gemfile_string.grep(/^\s*gem\b/).collect { |_gem| _gem }
    raise unless SyntaxChecker.check(gem_strings).valid?
    gem_strings.each do |gem_string|
      instance_eval gem_string
    end
  rescue
    @errors << "Error in syntax of Gemfile"
  end
  
  def gem(name, *args)
    if name.is_a?(Symbol)
      raise %{You need to specify gem names as Strings. Use 'gem "#{name.to_s}"' instead.}
    end

    options = Hash === args.last ? args.pop : {}
    version = args || [">= 0"]
    
    @gems_to_subscribe << { :name => name, :version => version }
  end
  
end