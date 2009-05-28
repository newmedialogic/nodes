require File.dirname(__FILE__) + '/../test_helper'


class ProvidesTest < Test::Unit::TestCase

  context "NodeAbstract association" do

    should "automatically instantiate a node_abstract" do
      assert_not_nil Page.new.node_abstract
    end

  end


  context "Page node provides (all defaults)" do

    setup do
      @node = Page.new
      @node.title = "Fake name"
      @node.body  = "Lorem ipsum body"
    end

    should "respond to path" do
      assert_respond_to @node, :path
    end

    should "respond to node_title" do
      assert_respond_to @node, :node_title
    end

    should "have the correct node_title" do
      assert_equal "Fake name", @node.node_title
    end

    should "respond to node_body" do
      assert_respond_to @node, :node_body
    end

    should "have the correct node_body" do
      assert_equal "Lorem ipsum body", @node.node_body
    end

    should "automatically associate node_abstract" do
      assert_respond_to @node, :node_abstract
    end

  end
end
