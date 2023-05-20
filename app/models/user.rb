class User < ApplicationRecord
    
    has_secure_password
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    has_many :blogs, dependent: :destroy
    has_many :comments, dependent: :destroy

end
