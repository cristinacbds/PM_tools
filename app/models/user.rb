class User < ApplicationRecord
    has_many :projects
    before_save { self.email = email.downcase }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password_digest, presence: true, length: { minimum: 8}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, format: VALID_EMAIL_REGEX, presence: true, uniqueness: { case_sensitive: false }

end
