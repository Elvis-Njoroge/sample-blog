class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :blog_id, :user_id
  belongs_to :blog
end
