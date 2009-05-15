class CreateNodeAbstracts < ActiveRecord::Migration                                                                                       

  def self.up
    create_table :node_abstracts do |t|

      # Polymorphic associations support
      t.column :node_id,   :integer, :null => false
      t.column :node_type, :string

      # Content caching and convenience fields
      # these duplicate data that can be found either in the Node
      # records themselves, or through rendering a node.
      #
      t.column :title,     :string
      t.column :summary,   :text
      t.column :content,   :text

    end
  end

  def self.down
    drop_table :node_abstracts
  end

end
