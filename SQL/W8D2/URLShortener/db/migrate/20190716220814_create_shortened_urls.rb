class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, null: false
      t.string :long_url, null: false
      t.integer :submitter_id, null: false
      t.timestamp
    end
    add_index :shortened_urls, :short_url, unique: true
  end
end
