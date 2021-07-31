class Fashion < ApplicationRecord
    belongs_to :user

    mount_uploaders :pic, PicUploader

    serialize :pic, JSON

    validates :pic, presence: true
    validates :title, presence: true
    validates :body, presence: true
end
