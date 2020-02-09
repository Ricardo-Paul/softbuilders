class UserSerializer < ActiveModel::Serializer
  attributes :id, :auth_token, :name, :email, :created_at, :updated_at
  has_many :projects
  has_many :contributed_projects
end
