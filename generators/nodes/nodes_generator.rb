class NodesGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      create_tinymce_files(m)
      create_nodes_css_files(m)
      create_nodes_javascript_files(m)
      m.migration_template 'create_node_abstracts.rb', "db/migrate", :migration_file_name => 'create_node_abstracts', :collision => :skip
    end
  end

  def create_nodes_css_files(m)
    m.directory "public/stylesheets/nodes"
    m.file "nodes.css", "public/stylesheets/nodes/nodes.css"
  end


  def create_nodes_javascript_files(m)
    m.directory "public/javascripts/nodes"
    m.file "nodes.js", "public/javascripts/nodes/nodes.js", :collision => :force
  end


  def create_tinymce_files(m)
    require 'find'

    m.directory "public/javascripts/nodes_tinymce"
    generator_root = File.dirname(__FILE__)
    template_root = File.join(generator_root, 'templates')
    Find.find(File.join(generator_root, 'templates', 'tiny_mce')) do |f|
      relative_path = f.gsub("#{template_root}/", '')
      if File.file?(f)
        m.file relative_path, "public/javascripts/#{relative_path}"
      else
        m.directory "public/javascripts/#{relative_path}"
      end
    end
  end

end
