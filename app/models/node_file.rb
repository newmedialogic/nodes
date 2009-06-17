class NodeFile < ActiveRecord::Base

  belongs_to :node, :polymorphic => true

end
