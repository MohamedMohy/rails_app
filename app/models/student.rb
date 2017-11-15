class Student < ApplicationRecord
    #attr_accessible :USERNAME,:PASSWORD,:PASSWORD_CONFIRMATION
    #attr_accessor :PASSWORD
   # before_save :encrypt_password
    validates :USERNAME, presence: true,
    
    uniqueness: { case_sensitive: false },
    
    length: { minimum: 3, maximum: 35 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :EMAIL, presence: true, length: { maximum: 50 },
    
    uniqueness: { case_sensitive: false },
    
    format: { with: VALID_EMAIL_REGEX }
      
    def self.authenticate(username, password)
      user = find_by_USERNAME(username)
      puts user.USERNAME
      puts user.PASSWORD
      puts user.EMAIL
      if user && user.PASSWORD == password
        user
      else
        nil
      end
    end
    
    # def encrypt_password
    #   if PASSWORD.present?
    #     self.passwordsalt = BCrypt::Engine.generate_salt
    #     self.PASSWORD = BCrypt::Engine.hash_secret(password, passwordssalt)
    #   end
    # end
  end