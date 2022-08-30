class Comment < ApplicationRecord
    belongs_to :activity, optional: true
    belongs_to :user, optional: true
    has_many :comments
    belongs_to :comment, optional: true
end
