Rails.application.configure do
  # --- 削除または変更すべき設定 ---
  
  # 削除: Sprockets関連の設定（APIモードでは使用不可）
  # config.assets.compile = true
  # config.assets.compile = false
  # config.asset_host = "http://assets.example.com"

  # 修正: 静的ファイルの配信設定
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # 修正: キャッシュストアを標準的なものに変更
  config.cache_store = :memory_store

  # 修正: ジョブキューアダプタを標準的なものに変更
  config.active_job.queue_adapter = :async

  # --- 必要な設定を追加 ---
  
  # SSLを有効化（HerokuでSSL設定済みの場合）
  config.force_ssl = true
  
  # ログレベルの設定
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # ログのタグ付け（リクエストIDを含む）
  config.log_tags = [:request_id]

  # ローカルエラーを非表示
  config.consider_all_requests_local = false

  # 言語のフォールバック設定
  config.i18n.fallbacks = true

  # マイグレーション後にスキーマをダンプしない
  config.active_record.dump_schema_after_migration = false
end
