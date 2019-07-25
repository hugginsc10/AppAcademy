class User < ApplicationRecord
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    attr_reader :password
    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token

    end
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    self.find_by_credentials(user_name, password)
        u = User.find_by(username: user_name)
        u.is_password?(password) 
    end


end