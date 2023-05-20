class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id, :comments_counter
  has_many :comments
end
