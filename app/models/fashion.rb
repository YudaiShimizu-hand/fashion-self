class Fashion < ApplicationRecord
    belongs_to :user

    mount_uploaders :pic, PicUploader

    serialize :pic, JSON
end
