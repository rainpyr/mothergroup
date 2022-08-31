class User < ApplicationRecord
    validates :name, length: { minimum: 2 }

    # don;t allow a User.create to proceed when the email field left blank
    validates :email, presence: true, uniqueness: true
    
    has_secure_password
    
    has_many :activities
    has_many :comments
    has_many :bookings
    has_many :products
    has_many :buys
end
