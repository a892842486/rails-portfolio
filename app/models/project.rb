class Project < ApplicationRecord
  has_many :project_skills, dependent: :destroy
  has_many :skills, through: :project_skills

  has_many :links, as: :linkable, dependent: :destroy

  has_many_attached :images

  validate :images_must_be_images

  accepts_nested_attributes_for :links, allow_destroy: true

  validates :name, presence: true
  validates :summary, presence: true
  validates :description, presence: true

  def images_must_be_images
    images.each do |image|
      unless image.content_type.start_with?("image/")
        errors.add(:images, "must be an image")
      end
    end
  end
end
