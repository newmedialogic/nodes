require File.join(File.dirname(__FILE__), 'lib', 'nodes')

%w(controllers helpers models views).each do |path|
  ActiveSupport::Dependencies.load_once_paths.delete File.join(File.dirname(__FILE__), 'app', path)
end

ActiveSupport::Dependencies.load_once_paths.delete File.join(File.dirname(__FILE__), 'lib')

ActiveSupport::Dependencies.load_paths << File.join(RAILS_ROOT, 'app', 'views')
ActiveSupport::Dependencies.load_once_paths.delete File.join(RAILS_ROOT, 'app', 'views')

