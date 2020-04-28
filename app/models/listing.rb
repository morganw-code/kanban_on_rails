class Listing < ApplicationRecord
    # each listing will belong to a user
    belongs_to :user
    has_one_attached :image
    # validate that selected fields are filled out
    validates :title, :message, presence: true
    # validates that a picture has been attached
    # has_one_attached :picture
end
