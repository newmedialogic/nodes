module Nodes
  module Provides

    module ClassMethods

      def paperclip_available?
        self.respond_to?(:has_attached_file)
      end


      def provides_nodes(options = {}, &block)
        send :include, InstanceMethods
        send :extend,  ExtensionMethods

        add_comment_associations
        add_node_abstract_associations
        add_paperclip_associations if paperclip_available?
        add_callbacks
      end


      def provides_blocks(options = {}, &block)
      end

    private
      
      def add_node_abstract_associations
        has_one :node_abstract, :as => :node, :dependent => :destroy
        accepts_nested_attributes_for :node_abstract
        delegate :path, :to => :node_abstract
      end

      def add_comment_associations
        has_many :node_comments,  :as => :node, :dependent => :nullify
      end

      def add_paperclip_associations
        has_many :node_images,      :as => :node, :dependent => :nullify
        has_many :node_attachments, :as => :node, :dependent => :nullify
      end


      def add_callbacks
        before_validation     :guarantee_node_abstract_present
        validates_presence_of :node_abstract
        validates_associated  :node_abstract
        after_save :save_node_abstract
      end

    end

    module ExtensionMethods

      def node_type?
        TRUE
      end

    end


    module InstanceMethods

      DEFAULT_NODE_TITLE_METHOD = :title
      DEFAULT_NODE_BODY_METHOD  = :body


      def node_title_method
        DEFAULT_NODE_TITLE_METHOD
      end


      def node_title
        self.send(node_title_method)
      end


      def node_body_method
        DEFAULT_NODE_BODY_METHOD
      end


      def node_body
        self.send(node_body_method)
      end


      def accessible_to?(user)
        return true
      end

      
      def update_node_abstract
        self.node_abstract.title = self.node_title
        self.node_abstract.content =  self.node_body
      end


      def save_node_abstract!
        update_node_abstract
        self.node_abstract.save || raise(ActiveRecord::RecordNotSaved)
      end


      def save_node_abstract
        build_node_abstract if self.node_abstract.nil?
        update_node_abstract
        node_abstract.save
      end


      def guarantee_node_abstract_present
        build_node_abstract if self.node_abstract.nil?
      end

    end

  end
end


ActiveRecord::Base.extend Nodes::Provides::ClassMethods
