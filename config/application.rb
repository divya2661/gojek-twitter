require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module GojekTwitter
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false
    config.middleware.use ActionDispatch::Session::CookieStore
    config.load_defaults 5.1
  end
end
