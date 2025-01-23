module Backend
  class Application < Rails::Application
    # Railsのデフォルト設定をロード（バージョン8.0を使用）
    config.load_defaults 8.0

    # Sprockets関連の不要な設定を削除
    # `assets`に関する設定はAPIモードでは使用しません
    # config.assets.compile = true

    # APIモードを有効化
    # 以下により、ミドルウェアが最小限に絞られ、ビューやアセットなどは生成されません
    config.api_only = true
  end
end
