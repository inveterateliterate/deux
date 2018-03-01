require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Deux
  class Application < Rails::Application

    app_folders = %w().map { |f| "app/#{f}" }
    root_folders = %w(lib)

    folders = (app_folders + root_folders).map { |f| "#{config.root}/#{f}/**/" }
    config.autoload_paths += Dir["#{config.root}/app/models/**/", "#{config.root}/lib/**/"]
    config.eager_load_paths += Dir["#{config.root}/app/models/**/", "#{config.root}/lib/**/"]
    config.autoload_paths += Dir[*folders]

    config.after_initialize do
      Rails.application.routes.default_url_options[:host] = ENV['APPLICATION_ROOT_URL']
    end

    root_url = ENV['APPLICATION_ROOT_URL']

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
