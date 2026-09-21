class Project < ApplicationRecord
  has_many :project_skills, dependent: :destroy
  has_many :skills, through: :project_skills

  has_many :links, as: :linkable, dependent: :destroy

  has_many :project_images, dependent: :destroy

  accepts_nested_attributes_for :links, allow_destroy: true

  accepts_nested_attributes_for :project_images, allow_destroy: true

  validates :name, presence: true
  validates :summary, presence: true
  validates :description, presence: true
end
