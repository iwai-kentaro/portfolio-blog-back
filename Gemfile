source "https://rubygems.org"

ruby '3.2.0'

gem "rails", "~> 8.0.1"
gem "puma", ">= 5.0"
gem "rack-cors"
gem "pg", "~> 1.2", group: :production
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'dotenv-rails', groups: [:development, :test]
gem 'bootsnap', '>= 1.4.4', require: false


group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem "debug", platforms: %i[mri mingw x64_mingw], require: "debug/prelude"
end
