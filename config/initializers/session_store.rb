# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_journal_session',
  :secret      => 'b555a8c71cc55300d048d4419141ad82cde4d4016733242ada2c6c574ed403213a023f8847c275592ca3c31d12b9c8b6a8a9d98e6edf2c2a8adb87e4e754413c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
