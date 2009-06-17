class CreateNodeFiles < ActiveRecord::Migration                                                                                       

  def self.up
    create_table :node_files do |t|

      t.column :title,       :string
      t.column :description, :text

      # Polymorphic associations support
      t.column :node_id,   :integer, :null => false
      t.column :node_type, :string
      
      # Single-Table Inheritance Support.
      # -- We'll use this same table for NodeAttachment, NodeImage, and NodeVideo
      t.column :type,        :string

      # Support for Paperclip
      t.column :file_file_name,    :string
      t.column :file_content_type, :string
      t.column :file_file_size,    :integer
      t.column :file_updated_at,   :datetime
    end


    add_index :node_files, :node_id
    add_index :node_files, :type
    add_index :node_files, [:node_type, :node_id]

  end

  def self.down
    drop_table :node_files
  end

end
