# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_crowd-test_session',
  :secret      => 'df82a8ceb15b1e0278ea029a6b7de37583171dd6607f404862f005fa008408c0fab99e75b07b2a977b12b2d9356e6729ded02ab26da3595b13867fbecb8de7ed'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
