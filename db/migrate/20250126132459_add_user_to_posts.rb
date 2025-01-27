class AddUserToPosts < ActiveRecord::Migration[8.0]
  def change
        # add_reference :posts, :user, null: false, foreign_key: true

        # user_id カラムが存在しない場合のみ追加
        unless column_exists?(:posts, :user_id)
          add_reference :posts, :user, null: false, foreign_key: true
        end
  end
end
