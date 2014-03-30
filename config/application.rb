require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
if defined?(Bundler)
  Bundler.require(*Rails.groups)
end

module MamMarzenie
  # Rails application
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over
    # those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record
    # auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names.
    # Default is UTC.
    config.time_zone = 'Warsaw'

    # The default locale is :en and all translations
    # from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[
      Rails.root.join('config', 'locales', '**', '*.{rb,yml}')
    ]
    config.i18n.default_locale = :pl
    config.i18n.available_locales = [:en, :pl]
    config.i18n.fallbacks = true

    console do
      require 'pry'
      config.console = Pry
      ActiveRecord::Base.connection
    end
  end
end
