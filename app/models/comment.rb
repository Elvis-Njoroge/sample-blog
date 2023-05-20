class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :blog

    validates :body, presence: true
    validates :user, presence: true
    validates :blog, presence: true
    
    after_save :update_comments_counter_add

    def update_comments_counter_add
        blog.increment!(:comments_counter)
    end
end
