require 'nodes/routes_loading_hack'
require 'nodes'
require 'nodes/provides'


# Make all paths of this plugins code not "load-once" style
# paths (meaning their code is reloaded on every request in
# development mode).
#
['lib', 'app/models', 'app/controllers', 'app/helpers', 'app/metal'].each do |dir|
  root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  path = File.join(root, dir)
  ActiveSupport::Dependencies.load_paths << path unless ActiveSupport::Dependencies.load_paths.include?(path)
  ActiveSupport::Dependencies.load_once_paths.delete(path)
end
