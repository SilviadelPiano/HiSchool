class School < ApplicationRecord
    # doesn't need validation, populated by developers
    has_many :school_classes
end
