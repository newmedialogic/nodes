class NodeAbstract < ActiveRecord::Base

  belongs_to :node, :polymorphic => true

end
