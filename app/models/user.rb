class User < ApplicationRecord 

    # Associations
    has_many :articles

    # Downcase email
    before_save { self.email = email.downcase }

    # Validations on Username
    validates :username, presence: true, uniqueness: { case_sensitive: false}, length: {minimum:3, maximum: 25}

    # Validations on Email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 105},
    format: {with: VALID_EMAIL_REGEX}
end