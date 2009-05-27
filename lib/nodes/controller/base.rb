load 'nodes/controller/default/actions.rb'
load 'nodes/controller/default/accessors.rb'
load 'nodes/controller/default/responses.rb'

module Nodes::Controller::Base

  include Nodes::Controller::Default::Actions
  include Nodes::Controller::Default::Accessors
  include Nodes::Controller::Default::Responses

end
