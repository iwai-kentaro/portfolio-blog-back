Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do # http://localhost:5173 は vue が起動するポート
    origins "http://localhost:3000", "http://localhost:5173"

    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ]
  end
end
