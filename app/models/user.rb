class User < ApplicationRecord
    before_save { self.email = email.downcase }
  
    enum status: { 'Want a guide': 0, 'Want to guide': 1, 'Want to run with anyone':2 }
  
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

end