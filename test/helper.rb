require 'rubygems'
require 'test/unit'
gem 'thoughtbot-shoulda', ">= 2.9.0"
require 'shoulda'
require 'mocha'

require 'active_record'
require 'active_support'

ROOT       = File.join(File.dirname(__FILE__), '..')
RAILS_ROOT = ROOT

$LOAD_PATH << File.join(ROOT, 'lib')
$LOAD_PATH << File.join(ROOT, 'lib', 'nodes')

require File.join(ROOT, 'lib', 'nodes.rb')

# require 'shoulda_macros/nodes'

ENV['RAILS_ENV'] ||= 'test'

FIXTURES_DIR = File.join(File.dirname(__FILE__), "fixtures") 
config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
ActiveRecord::Base.establish_connection(config['test'])

=begin
def reset_class class_name
  ActiveRecord::Base.send(:include, Paperclip)
  Object.send(:remove_const, class_name) rescue nil
  klass = Object.const_set(class_name, Class.new(ActiveRecord::Base))
  klass.class_eval{ include Paperclip }
  klass
end

def reset_table table_name, &block
  block ||= lambda{ true }
  ActiveRecord::Base.connection.create_table :dummies, {:force => true}, &block
end

def modify_table table_name, &block
  ActiveRecord::Base.connection.change_table :dummies, &block
end

def rebuild_model options = {}
  ActiveRecord::Base.connection.create_table :dummies, :force => true do |table|
    table.column :other, :string
    table.column :avatar_file_name, :string
    table.column :avatar_content_type, :string
    table.column :avatar_file_size, :integer
    table.column :avatar_updated_at, :datetime
  end
  rebuild_class options
end

def rebuild_class options = {}
  ActiveRecord::Base.send(:include, Nodes)
  Object.send(:remove_const, "Dummy") rescue nil
  Object.const_set("Dummy", Class.new(ActiveRecord::Base))
  Dummy.class_eval do
    include Nodes
    defines_nodes
  end
end

def temporary_rails_env(new_env)
  old_env = defined?(RAILS_ENV) ? RAILS_ENV : nil
  silence_warnings do
    Object.const_set("RAILS_ENV", new_env)
  end
  yield
  silence_warnings do
    Object.const_set("RAILS_ENV", old_env)
  end
end

=end
