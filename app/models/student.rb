class Student < ApplicationRecord
    validates :USERNAME, presence: true,
    
    uniqueness: { case_sensitive: false },
    
    length: { minimum: 3, maximum: 35 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :EMAIL, presence: true, length: { maximum: 50 },
    
    uniqueness: { case_sensitive: false },
    
    format: { with: VALID_EMAIL_REGEX }
    
    
end