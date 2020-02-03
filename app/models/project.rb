class Project < ApplicationRecord    
    validates :title, presence: true
    validates :stacks, presence: true
    validates :description, presence: true

    belongs_to :user
end