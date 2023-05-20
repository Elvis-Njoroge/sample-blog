class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :blogs_counter
  has_many :blogs
end
