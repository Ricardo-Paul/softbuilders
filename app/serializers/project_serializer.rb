class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :stacks, :description, :gitlink, :created_at, :updated_at

  belongs_to :user, serializer: UserSerializer
  belongs_to :company, serializer: CompanySerializer
  has_many :project_contributors
end
