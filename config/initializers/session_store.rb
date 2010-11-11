# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_crowd-test_session',
  :secret      => 'f621545a42ce3c8bba2c5b74008c4cc9b1b9da6c918770bb795ab51b5fa91cd4eeb21cdf7e6e3d91bc269b1ca5ae53a0f9d10fc09300fc946a5826e2cbd0422b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
