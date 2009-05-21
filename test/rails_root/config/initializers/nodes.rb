nodes_path = File.join(File.dirname(__FILE__), *%w(.. .. .. ..))
nodes_lib_path = File.join(nodes_path, "lib")

$LOAD_PATH.unshift(nodes_lib_path)
load File.join(nodes_path, 'rails', 'init.rb')
