ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'criterion', 'criteria'
end

ActionController::Base.send(:helper, [:blocks, :nodes, :node_comments, :node_disqus])

# Nodes adds a minimalist content management system atop any
# Rails model.
# Author:: Aaron Longwell
# Copyright:: 2009 New Media Logic
# License:: MIT License (http://www.opensource.org/licenses/mit-license.php) 
module Nodes

  VERSION = "0.1.0"

  def self.node_classes
    @@node_classes ||= begin
      Dir.glob(RAILS_ROOT + '/app/models/*.rb').each { |file| require_dependency file }
      models = Object.subclasses_of(ActiveRecord::Base)
      models.select{ |m| m.respond_to?(:node_type?) }
    end
  end

end
