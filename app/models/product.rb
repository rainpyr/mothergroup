class Product < ApplicationRecord
    
    belongs_to :user, optional: true
    has_and_belongs_to_many :kinds
    has_many :comments
    has_one :buy
end
