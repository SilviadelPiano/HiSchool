class Post < ApplicationRecord

    belongs_to :user				
    has_and_belongs_to_many :users		
    has_and_belongs_to_many :school_classes

    def start_time
        self.deadline
    end
end
