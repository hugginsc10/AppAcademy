class User < ApplicationRecord
    validates :email, uniqueness: true, presence: true

    has_many :submitted_urls,
    class_name: :ShortenedURL,
    primary_key: :id,
    foreign_key: :submitter_id
end