class NodesGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.migration_template 'create_node_abstracts.rb', "db/migrate", :migration_file_name => 'create_node_abstracts'
    end
  end

end
