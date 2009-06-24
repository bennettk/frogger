# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_frogger_session',
  :secret      => '7e01decbff0d58ecf8ea8c8a4b659490eba4bc33cfb66f139c923673b5b2096fafbd15e41df2bb4eb2108a17a01e75bf67bc1a3345345ed9d0f8df5fe83277a8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
