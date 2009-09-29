module NodeDisqusHelper

  def disqus_javascript(site_name)
    html = <<EOF
      <script type="text/javascript">
        var disqus_developer = #{ENV['RAILS_ENV'] == 'production' ? 0 : 1};
      //<![CDATA[
      (function() {

        var links = document.getElementsByTagName('a');
        var query = '?';
        for(var i = 0; i < links.length; i++) {
        if(links[i].href.indexOf('#disqus_thread') >= 0) {
          query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
        }
        }
        document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/#{site_name}/get_num_replies.js' + query + '"></' + 'script>');
      })();
      //]]>
      </script>
EOF
  end

  def disqus_comments
    '<div id="disqus_thread"></div><script type="text/javascript" src="http://disqus.com/forums/childrensjusticealliance/embed.js"></script><noscript><a href="http://childrensjusticealliance.disqus.com/?url=ref">View the discussion thread.</a></noscript><a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>'
  end

end
