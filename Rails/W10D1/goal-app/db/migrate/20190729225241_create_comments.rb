class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.text :body
      t.integer :comment_id
      t.timestamps
    end
  end
end
