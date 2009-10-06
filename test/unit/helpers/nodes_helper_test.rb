require File.dirname(__FILE__) + '/../../test_helper' 
include NodesHelper


def nodes_user
  return User.new
end

class NodesHelperTest < ActionView::TestCase

  context "Nodes Head" do

    setup do
      @html = nodes_head()
    end

    should "include nodes.css" do
      assert_match /nodes\.css/, @html
    end

    should "include nodes.js" do
      assert_match /nodes\.js/, @html
    end

  end


end
