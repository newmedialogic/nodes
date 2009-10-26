class CreateNodesMigration < ActiveRecord::Migration                                                                                       

  def self.up

    # ########################################
    # node_abstracts
    #
    create_table :node_abstracts do |t|
      # Polymorphic associations support
      t.column :node_id,   :integer, :null => false
      t.column :node_type, :string
      
      # URL path finder support
      t.column :path,      :string

      # Content caching and convenience fields
      # these duplicate data that can be found either in the Node
      # records themselves, or through rendering a node.
      #
      t.column :title,     :string
      t.column :summary,   :text
      t.column :content,   :text
      t.timestamps
    end

    add_index :node_abstracts, :node_id
    add_index :node_abstracts, [:node_type, :node_id]
    add_index :node_abstracts, :path


    # ########################################
    # node_blocks
    #
    create_table :node_blocks do |t|
      t.column :region,       :string

      # Polymorphic association to "content" (NodeBlock, NodeAbstract, NodeView)
      t.column :content_id,   :integer
      t.column :content_type, :string

      t.column :title,        :string
      t.column :position,     :integer, :null => false, :default => 0
      t.timestamps
    end

    add_index :node_blocks, [:region, :position]


    # ########################################
    # node_comments
    #
    create_table :node_comments do |t|
      # Polymorphic association to node
      t.column :node_id,   :integer, :null => false
      t.column :node_type, :string
      
      # Polymorphic association to user
      t.column :user_id,   :integer
      t.column :user_type, :string

      t.column :author,    :string
      t.column :email,     :string
      t.column :subject,   :string
      t.column :content,   :text

      t.column :spam,      :boolean, :default => false, :null => false
      t.column :spaminess, :float
      t.column :flagged,   :boolean, :default => false, :null => false
      t.column :signature, :string

      t.timestamps
    end

    add_index :node_comments, :node_id
    add_index :node_comments, [:node_type, :node_id]
    add_index :node_comments, :user_id

    
    # ########################################
    # node_files
    #
    create_table :node_files do |t|
      t.column :title,       :string
      t.column :description, :text

      # Polymorphic associations support
      t.column :node_id,   :integer
      t.column :node_type, :string
      
      # Single-Table Inheritance Support.
      # -- We'll use this same table for NodeAttachment, NodeImage, and NodeVideo
      t.column :type,        :string

      # Support for Paperclip
      t.column :file_file_name,    :string
      t.column :file_content_type, :string
      t.column :file_file_size,    :integer
      t.column :file_updated_at,   :datetime
      t.timestamps
    end

    add_index :node_files, :node_id
    add_index :node_files, :type
    add_index :node_files, [:node_type, :node_id]


    # ########################################
    # node_terms
    #
    create_table :node_terms do |t|
      t.column :node_vocabulary_id, :integer
      t.column :name, :string
      t.column :description, :text
      t.column :position, :integer
      t.timestamps
    end

    add_index :node_terms, :node_vocabulary_id
    add_index :node_terms, :name


    # ########################################
    # node_views
    #
    create_table :node_views do |t|
      t.column :name,        :string
      t.column :title,       :string
      t.column :description, :text
      t.column :is_a_block,  :boolean, :null => false, :default => true
      t.column :is_a_page,   :boolean, :null => false, :default => false
      t.timestamps
    end


    # ########################################
    # node_view_criteria
    #
    create_table :node_view_criteria do |t|
      t.column :node_view_id, :integer
      t.column :field,        :string
      t.column :value,        :string
      t.column :operator,     :string
      t.column :position,     :integer
      t.timestamps
    end

    add_index :node_view_criteria, [:node_view_id, :position]


    # ########################################
    # node_vocabularies
    #
    create_table :node_vocabularies do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :position, :integer, :null => false, :default => 0
      t.timestamps
    end

    add_index :node_vocabularies, [:position, :title]


    # ########################################
    # url_aliases
    #
    create_table :url_aliases do |t|
      t.column :url, :string
      # Polymorphic association to "content" (NodeBlock, NodeAbstract, NodeView)
      t.column :content_id,   :integer
      t.column :content_type, :string
      t.timestamps
    end

    add_index
  end


  def self.down
    drop_table :url_aliases
    drop_table :node_vocabularies
    drop_table :node_view_criteria
    drop_table :node_views
    drop_table :node_terms
    drop_table :node_files
    drop_table :node_comments
    drop_table :node_blocks
    drop_table :node_abstracts
  end

end
