class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :blog_id, :user_id
end
