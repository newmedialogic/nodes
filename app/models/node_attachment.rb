class NodeAttachment < NodeFile

  belongs_to :node, :polymorphic => true

  has_attached_file(:file) if respond_to?(:has_attached_file)
  alias_attribute :file, :attachment

end
