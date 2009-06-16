class CreateNodeAttachments < ActiveRecord::Migration                                                                                       

  def self.up
    create_table :node_attachments do |t|
      # Polymorphic associations support
      t.column :node_id,   :integer, :null => false
      t.column :node_type, :string
      
      t.column :title,       :string
      t.column :description, :text

      # Support for Paperclip
      t.column :file_file_name,    :string
      t.column :file_content_type, :string
      t.column :file_file_size,    :integer
      t.column :file_updated_at,   :datetime
    end


    add_index :node_attachments, :node_id
    add_index :node_attachments, [:node_type, :node_id]

  end

  def self.down
    drop_table :node_attachments
  end

end
