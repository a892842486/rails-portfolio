class Skill < ApplicationRecord
    has_many :project_skills, dependent: :destroy
    has_many :projects, through: :project_skills

    validates :name, presence: true, uniqueness: true
end
