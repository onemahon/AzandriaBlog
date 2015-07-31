# config/initializers/timeout.rb
Rack::Timeout.timeout = 20  # seconds

Rack::Timeout.unregister_state_change_observer(:logger) if Rails.env.development?
