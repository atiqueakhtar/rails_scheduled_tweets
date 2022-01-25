# email:string
# password_digest:string

# Virtual Attributes:
# password:string
# password_confirmation:string

# has_secure_password creates above two vertual attributes and then bcrypts password and stores that in password_digest.

class User < ApplicationRecord
    has_many :twitter_account
    has_secure_password
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address." }
end