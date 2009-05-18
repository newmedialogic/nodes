require File.dirname(__FILE__) + '/helper.rb'
require 'rails_generator'
require 'rails_generator/scripts/generate'

class NodeTypeGeneratorTest < Test::Unit::TastCase

  def setup
    FileUtils.mkdir_p(fake_rails_root)
  end


  def teardown
    FileUtils.rm_r(fake_rails_root)
  end


  def test_generates_model_file
  end


  def test_generates_controller_file
  end


private

  def fake_rails_root
    File.join(File.dirname(__FILE__), 'rails_root')
  end

end
