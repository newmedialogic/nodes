require File.dirname(__FILE__) + '/../test_helper'

class ProvidesTest < Test::Unit::TestCase

  context "Added methods" do

    setup { @page = Page.new }

    should "respond to path" do
      assert_respond_to @page, :path
    end

    should "automatically associate node_abstract" do
      assert_respond_to @page, :node_abstract
    end

  end
end
