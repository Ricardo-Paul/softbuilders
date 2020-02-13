class UserSerializer < ActiveModel::Serializer
  attributes :id, :auth_token, :name, :email, :created_at, :updated_at, :picture
  has_many :projects
  has_many :contributed_projects


  # has_one :attachment do |picture|
  #   picture.attachment.attached? ? picture.attachment : nil
  # end
end
