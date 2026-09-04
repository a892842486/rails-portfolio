class Profile < ApplicationRecord
    has_many :links, as: :linkable, dependent: :destroy

    validates :display_name, presence: true
    validates :job_title, presence: true
    validates :introduction, presence: true
    validates :contact_email, presence: true
end
