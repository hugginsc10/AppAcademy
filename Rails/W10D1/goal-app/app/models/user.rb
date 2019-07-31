class User < ApplicationRecord
   validates :email, :session_token, :password_digest, presence: true
   validates :password, length: { minimum: 6 }
   validates_uniqueness_of :email, case_insensitive: true
   
   before_validation :ensure_token
   attr_reader :password

   has_many :goals
   
   def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
   end

   def self.generate_session_token
      SecureRandom::urlsafe_base64(16)
   end

   def self.find_by_credentials(email, password)
   user = User.find_by(email: email)
   return nil unless user
   user.is_password?(password) ? user : nil
   end

   def is_password?(password)
   BCrypt::Password.new(self.password_digest).is_password?(password)
   end


   def ensure_token
      self.session_token ||= self.class.generate_session_token
   end

   def reset_session_token!
      self.update!(session_token: User.generate_session_token)
      self.session_token
   end

end