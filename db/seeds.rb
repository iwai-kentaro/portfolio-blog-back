# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# デフォルトのユーザーを作成
default_user = User.create!(
  name: "Default User",
  email: "default@example.com",
  password: "password"
)

# 既存のpostsにuser_idを設定
Post.update_all(user_id: default_user.id)

# 新しいpostsを作成（任意）
Post.create!(
  [
    { title: "Post 1", content: "This is the first post.", user_id: default_user.id },
    { title: "Post 2", content: "This is the second post.", user_id: default_user.id }
  ]
)
