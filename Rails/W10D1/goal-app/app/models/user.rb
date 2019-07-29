class User < ApplicationRecord
validates :email, :session_token, :password_digest, presence: true
validates :password, length: {minimum: 6}



end