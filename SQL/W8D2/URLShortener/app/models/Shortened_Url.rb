class ShortenedURL < ApplicationRecord
    validates :short_url, :long_url, presence: true
    validates :short_url, uniqueness: true

    belongs_to :submitter,
        class_name: :User,
        primary_key: :id,
        foreign_key: :submitter_id
       

    def self.random_code
        random_code = SecureRandom.urlsafe_base64(16)
        unless ShortenedURL.exists?(short_url: random_code)
            return random_code
        end
    end

    def self.create_shortened_url_for_user(user, long_url)
        ShortenedURL.create( #collection.create(attributes = {})
            submitter_id: user.id,
            long_url: long_url,
            short_url: ShortenedURL.random_code)
        
    end
end
