class Activity < ApplicationRecord
    belongs_to :user, optional: true
    has_and_belongs_to_many :categories
    has_many :comments
    has_many :bookings
end
