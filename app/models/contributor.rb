class Contributor < ApplicationRecord
  validates :user_id, presence: true
  validates :project_id, presence: true

  belongs_to :user, inverse_of: :contributors
  belongs_to :project, inverse_of: :contributors
end
