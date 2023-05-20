class Blog < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    after_save :update_blogs_counter_add

    def update_blogs_counter_add
        user.increment!(:blogs_counter)
    end
end
