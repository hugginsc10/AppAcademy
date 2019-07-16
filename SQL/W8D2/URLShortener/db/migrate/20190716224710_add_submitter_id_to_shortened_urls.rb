class AddSubmitterIdToShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    add_column :shortened_urls, :fieldname, :string
    add_column :shortened_urls, :integer, :string
  end
end
