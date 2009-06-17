class NodeImage < NodeFile 

  DEFAULT_PAPERCLIP_OPTIONS = {
    :styles => {
      :normal    => "500x500",
      :medium    => "300x300",
      :small     => "140x140",
      :tiny      => "60x60#"
    }
  }

  belongs_to :node, :polymorphic => true

  has_attached_file(:file, DEFAULT_PAPERCLIP_OPTIONS) if respond_to?(:has_attached_file)

end
