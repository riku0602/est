class Menu < ApplicationRecord

    mount_uploader :image, ImageUploader
    has_many :likes, dependent: :destroy
end
