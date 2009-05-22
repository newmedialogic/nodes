require File.dirname(__FILE__) + '/../test_helper'

class ProvidesTest < Test::Unit::TestCase

  should "automatically associate node_abstract" do
    page = Page.new
    assert page.respond_to?(:node_abstract)


    assert true
  end

end
