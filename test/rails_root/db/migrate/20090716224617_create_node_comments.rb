class CreateNodeComments < ActiveRecord::Migration                                                                                       

  def self.up
    create_table :node_comments do |t|

      # Polymorphic association to node
      t.column :node_id,   :integer, :null => false
      t.column :node_type, :string
      
      # Polymorphic association to user
      t.column :user_id,   :integer
      t.column :user_type, :string

      t.column :title,     :string
      t.column :comment,   :text

      t.timestamps
    end


    add_index :node_comments, :node_id
    add_index :node_comments, [:node_type, :node_id]
    add_index :node_comments, :user_id

  end

  def self.down
    drop_table :node_comments
  end

end
