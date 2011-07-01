require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Notification do
  
  it { should belong_to(:gem_item) }
  
end