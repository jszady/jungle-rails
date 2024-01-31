class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates_length_of :password, minimum: 8

    def self.authenticate_with_credentials(email, password)
        user = User.find_by_email(email.downcase.strip)
        if user && user.authenticate(password)
          user
        else
          nil
        end
    end
end
