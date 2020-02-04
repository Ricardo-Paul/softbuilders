class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :updated_at
  has_many :projects
  has_many :contributed_projects
end
