class NodesGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.directory "app/pages"
      create_tinymce_files(m)
      create_images(m)
      create_nodes_css_files(m)
      create_nodes_javascript_files(m)
      create_migrations(m)
    end
  end


  def create_migrations(m)
    m.migration_template 'create_node_files.rb', 'db/migrate', :migration_file_name => 'create_node_files'
    m.migration_template 'create_node_abstracts.rb',   'db/migrate', :migration_file_name => 'create_node_abstracts'
  end


  def create_images(m)
    m.directory "public/images"
    m.file "icons.gif", "public/images/icons.gif"
  end


  def create_nodes_css_files(m)
    m.directory "public/stylesheets/nodes"
    m.file "nodes.css", "public/stylesheets/nodes/nodes.css"
    m.file "nodes_popup.css", "public/stylesheets/nodes/nodes_popup.css"
  end


  def create_nodes_javascript_files(m)
    m.directory "public/javascripts/nodes"
    m.file "nodes.js", "public/javascripts/nodes/nodes.js", :collision => :force
    m.file "nodes_popup.js", "public/javascripts/nodes/nodes_popup.js", :collision => :force
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
