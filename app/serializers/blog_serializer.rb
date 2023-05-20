class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :comments_counter
  has_many :comments
end
