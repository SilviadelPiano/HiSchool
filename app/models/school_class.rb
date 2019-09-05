class SchoolClass < ApplicationRecord

    belongs_to :school
    has_many :users, through: => membership
    has_and_belongs_to_many :users
    has_and_belongs_to_many :posts
end
