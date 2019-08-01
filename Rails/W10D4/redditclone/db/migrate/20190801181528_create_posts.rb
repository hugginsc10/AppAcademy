class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.string :content
      t.belongs_to :sub, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
    add_index :posts, :title, unique: true
    add_index :posts, :url, unique: true
  
  end
end
