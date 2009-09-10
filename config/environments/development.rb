# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

# If you fork this set it to your opentransact service providers details here:
OPEN_TRANSACT_NAME="NuBux"
OPEN_TRANSACT_URL="http://nubux.dev"
OPEN_TRANSACT_CONSUMER_KEY="Bdstb50Plic5lPN0Ste88w"
OPEN_TRANSACT_CONSUMER_SECRET="tY5mKvKs5xhNtcoLNdou6aOagK0p0Nqq29dwpTtwXc"
