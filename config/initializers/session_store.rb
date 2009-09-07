# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_capcard_session',
  :secret      => '4c55982b5c36c4e3bf2758282643bde83dd16662df289551385506a13baa1d9d0565c9e9d2cb9c5c0c42d25b8498291020112e91394daa80f64689082a92abf1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
