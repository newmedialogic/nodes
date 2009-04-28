class NodesController < ApplicationController

  before_filter :assemble_blocks
  helper :blocks

  prepend_view_path "app/pages"
  append_view_path "app/blocks"

  def index
    @nodes = []
  end

  def show
    @args = params[:path]
    # render :text => rand(100) and return
    render_static_path
  end

private

  def render_static_path
    path_parts = params[:path]

    loop do
      path = File.join(RAILS_ROOT, 'app', 'pages', path_parts)
      rel_path = File.join(path_parts)
      logger.error(path)
      logger.error(rel_path)
      logger.error '-' * 80
      if template_exists?(rel_path) 
        render :template => rel_path, :layout => determine_layout and return
      elsif template_exists?("#{rel_path}/index")
        render :template => "#{rel_path}/index" and return
      end
      break if path_parts.empty?
      path_parts.pop
    end
  end


  def determine_layout
    "application"
  end


  def template_exists?(path)
    self.view_paths.find_template(path, response.template.template_format)
  rescue ActionView::MissingTemplate
    false
  end


  def assemble_blocks

  end

end
