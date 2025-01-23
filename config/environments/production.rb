Rails.application.configure do
  # Force all access to the app over SSL and use secure cookies.
  config.force_ssl = true

  # Caching headers for public assets
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.year.to_i}"
  }

  # Set the logging level
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Use default logging formatter
  config.log_formatter = ::Logger::Formatter.new

  # Log to STDOUT for Heroku
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # Don't include all error details in production
  config.consider_all_requests_local = false

  # Database migrations
  config.active_record.dump_schema_after_migration = false

  # Internationalization fallback
  config.i18n.fallbacks = true

  # Disable deprecation notices
  config.active_support.report_deprecations = false

  # Other production-specific settings
  config.eager_load = true
end
