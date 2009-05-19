# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nodes-0.1.0_session',
  :secret      => '341ac4f146ed5c32bd204e4f99406660d6b956ce19f14e50575817eb899691cb588d116caf469074e10a05930776df5b790d6b592bc5079706441d3e9c9c1921'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
