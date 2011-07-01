# reference : http://www.dan-manges.com/blog/ruby-syntax-checker-using-open3
require "open3"

class SyntaxChecker
  def self.check(ruby)
    Open3.popen3 "ruby -wc" do |stdin, stdout, stderr|
      stdin.write ruby
      stdin.close
      output = stdout.read
      errors = stderr.read
      SyntaxCheckResult.new(output.any? ? output : errors)
    end
  end
end

class SyntaxCheckResult
  def initialize(output)
    @valid = (output == "Syntax OK\n")
    @output = output
  end
  
  def line_of_error
    $1.to_i if @output =~ /^-:(\d+):/
  end
  
  def valid?
    @valid
  end
end


#require "test/unit"
#
#class SyntaxCheckerTest < Test::Unit::TestCase    
#  def test_valid_syntax
#    result = SyntaxChecker.check "this.is.valid.syntax"
#    assert_equal true, result.valid?
#  end
#  
#  def test_invalid_syntax
#    result = SyntaxChecker.check "this.is -> not -> valid $ruby:syntax"
#    assert_equal false, result.valid?
#  end
#  
#  def test_invalid_syntax_line_number
#    result = SyntaxChecker.check "line(1).is.okay\nline(2) is not :("
#    assert_equal 2, result.line_of_error
#  end
#end