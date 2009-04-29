module BlocksHelper

  BLOCKS = {
    :content_top => ['/mission_top'],
    :inner_sidebar => ['/pio', '/principles']
  }

  def has_blocks_for?(name)
    if params[:path].empty?
      if BLOCKS.has_key?(name)
        return true
      end
    end
  end


  def render_blocks_for(name)
    val = ""
    if params[:path].empty?
      return if BLOCKS[name].empty?
      BLOCKS[name].each do |block|
        val = val + render("#{block}")
      end
    end
    val
  end

end
