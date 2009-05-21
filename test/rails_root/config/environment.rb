require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.load_paths += Dir.glob(File.join(RAILS_ROOT, 'vendor', 'gems', '*', 'lib'))
  config.time_zone = 'Pacific Time (US & Canada)'
  config.action_controller.session = {
    :session_key => "_nodes_session",
    :secret => "44ca7efd814e428097af4d5e75b1cdf5fd9ab41e47a9ef4f6477a8a000bf404f5d907853a9617cfd55fb62eae803595b5cbe8b23c1f9a1459e1407e3e82d7038"
  }
end
