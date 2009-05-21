require File.dirname(__FILE__) + '/../../test_helper.rb'
include NodesHelper

class NodesHelperTest < Test::Unit::TestCase

  def test_nodes_head
    assert_match /Nodes Header Code/, nodes_head()
  end

end
