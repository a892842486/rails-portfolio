class Project < ApplicationRecord
    has_many :project_skills, dependent: :destroy
    has_many :skills, through: :project_skills

    has_many :links, as: :linkable, dependent: :destroy

    validates :name, presence: true
    validates :summary, presence: true
    validates :description, presence: true
end
