class Comment < ApplicationRecord
    belongs_to :activity, optional: true
    belongs_to :user, optional: true
    has_many :replies
end
