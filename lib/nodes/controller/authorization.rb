# Adds a before_filter to prepare data for Nodes authorization within
# Nodes controller methods and in the views. All authorization questions
# are encapsulated in the @node_user object, which this module creates.
#
module Nodes::Controller::Authorization

  def nodes_user

    if respond_to?(:current_user, true)
      self.send(:current_user) || Nodes::AnonymousUser.new
    elsif respond_to?(:active_user, true)
      self.send(:active_user) || Nodes::AnonymousUser.new
    else
      raise Nodes::ConfigurationError.new("Please implement current_user or active_user in your controller, and make it return an object that represents a user.")
    end
  end

end

