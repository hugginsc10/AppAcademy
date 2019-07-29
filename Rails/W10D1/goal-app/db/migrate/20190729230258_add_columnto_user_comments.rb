class AddColumntoUserComments < ActiveRecord::Migration[5.2]
  def change
    add_column(:user_comments, :user_id, :integer, null: false)
    add_column(:user_comments, :comment_id, :integer, null: false)
  end
end
