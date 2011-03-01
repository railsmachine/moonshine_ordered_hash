require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

class OrderedHashManifest < Moonshine::Manifest::Rails
end

describe 'ordered hashes' do
  describe 'with ordered hash' do
    it "should be an instance of OrderedHash" do
      h = Hash.new
      h.class.should == ActiveSupport::OrderedHash
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

  describe 'with configuration' do
    before do
      @manifest = OrderedHashManifest.new
    end

    it "should always be the same" do
      h = Hash.new
      @manifest.configuration.each do |key, value|
        h[key] = value
      end
      h.should == @manifest.configuration
    end

    it "should still be the same string too" do
      h = Hash.new
      @manifest.configuration.each do |key, value|
        h[key] = value
      end

      h_str = ""
      h.each do |key, value|
        h_str << "#{key} = #{value}\n"
      end

      man_str = ""
      @manifest.configuration.each do |key, value|
        man_str << "#{key} = #{value}\n"
      end

      h_str.should == man_str
    end
  end
end
