class Blog < ApplicationRecord
    belongs_to :user
    has_many :comments

    def update_posts_counter_add
        user.increment!(:blogs_counter)
    end
end
