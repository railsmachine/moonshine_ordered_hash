require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe 'ordered hashes' do
  describe 'with ordered hash' do
    it "should be an instance of OrderedHash" do
      h = Hash.new
      h.class.should == 'ActiveSupport::OrderedHash'
    end

    it "should be equivalent to an OrderedHash" do
      h = Hash.new
      oh = ActiveSupport::OrderedHash.new
      %w(foo bar baz alpha beta delta).each do |k|
        h[k] = k
        oh[k] = k
      end
      h.should == oh
    end
  end
end
