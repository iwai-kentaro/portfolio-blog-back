require_relative 'boot'

require 'rails'
require 'dotenv/load' # ここに追加

# 必要なRailsフレームワークを選択
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module YourAppName
  class Application < Rails::Application
    config.load_defaults 8.0

    # APIモードを使用
    config.api_only = true
  end
end
