class NodeComment < ActiveRecord::Base

  belongs_to :node, :polymorphic => true
  belongs_to :user, :polymorphic => true

  validates_presence_of :node_id


  def after_create
    return if self.node.nil?
    return if not self.node.respond_to?(:updated_at=)
    self.node.updated_at = Time.zone.now
    self.node.save
  end

end
