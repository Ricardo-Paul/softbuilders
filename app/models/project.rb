class Project < ApplicationRecord    
    validates :title, presence: true
    validates :stacks, presence: true
    validates :description, presence: true

    belongs_to :user
    belongs_to :company

    accepts_nested_attributes_for :company
end
