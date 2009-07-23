load 'nodes/controller/actions.rb'
load 'nodes/controller/accessors.rb'
load 'nodes/controller/responses.rb'
load 'nodes/controller/comments.rb'

module Nodes::Controller::Base

  include Nodes::Controller::Actions
  include Nodes::Controller::Accessors
  include Nodes::Controller::Responses
  
  include Nodes::Controller::Comments

end
