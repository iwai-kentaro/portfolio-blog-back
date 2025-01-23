module Backend
  class Application < Rails::Application
    config.load_defaults 8.0

    # 不要なSprockets関連設定を削除
    # config.assets.compile = true

    # APIモードを有効化
    config.api_only = true
  end
end
