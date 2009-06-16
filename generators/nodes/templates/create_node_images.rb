class CreateNodeImages < ActiveRecord::Migration                                                                                       

  def self.up
    create_table :node_images do |t|

      # Polymorphic associations support
      t.column :node_id,   :integer, :null => false
      t.column :node_type, :string
      
      t.column :title,   :string
      t.column :caption, :text

      # Support for Paperclip
      t.column :image_file_name,    :string
      t.column :image_content_type, :string
      t.column :image_file_size,    :integer
      t.column :image_updated_at,   :datetime
      
    end


    add_index :node_images, :node_id
    add_index :node_images, [:node_type, :node_id]
    add_index :node_images, :path

  end

  def self.down
    drop_table :node_images
  end

end
