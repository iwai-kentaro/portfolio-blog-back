# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # 許可するオリジンを設定
    origins /\Ahttps:\/\/portfolio-blog-front-[a-zA-Z0-9-]+-iwai-kentaros-projects\.vercel\.app\z/

    # 許可するリソースと HTTP メソッドを指定
    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
