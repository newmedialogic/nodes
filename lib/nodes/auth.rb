module Nodes::Auth

  def self.loaded
    ActionController::Base.send(:include, Nodes::Auth::Controller)
  end

end
