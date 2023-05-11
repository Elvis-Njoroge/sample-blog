class User < ApplicationRecord
    
    has_secure_password
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    has_many :blogs
    has_many :comments

    def update_blogs_counter
        self.blogs_counter = self.blogs.count
        self.save
    end
    
end
