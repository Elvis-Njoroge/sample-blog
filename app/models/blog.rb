class Blog < ApplicationRecord
    belongs_to :user
    has_many :comments

    def update_comments_counter
        self.comments_counter = self.comments.count
        self.save
    end
end
