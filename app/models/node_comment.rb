class NodeComment < ActiveRecord::Base

  belongs_to :node, :polymorphic => true
  belongs_to :user, :polymorphic => true

  validates_presence_of :node_id

end
