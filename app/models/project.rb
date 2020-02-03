class Project < ApplicationRecord    
    validates :title, presence: true
    validates :stacks, presence: true
    validates :description, presence: true

    belongs_to :user
    belongs_to :company

    has_many :contributors
    has_many :project_contributors, :class_name => "User", :through => :contributors, source: :user
    # has_many :users, through: :contributors

    accepts_nested_attributes_for :company
end
