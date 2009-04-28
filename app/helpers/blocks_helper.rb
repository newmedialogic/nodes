module BlocksHelper

  def render_blocks_for(name)
    if params[:path].empty?
      render "/top_story"
    end
  end

end
