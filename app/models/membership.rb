class Membership < ApplicationRecord
    belongs_to :user
    belongs_to :schoolClass, class_name: "SchoolClass"
end
