class Profile < ApplicationRecord
    has_many :links, as: :linkable, dependent: :destroy
end
