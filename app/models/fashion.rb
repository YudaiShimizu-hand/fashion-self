class Fashion < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy 
    has_many :liking_users, through: :likes, source: :user
    

    mount_uploaders :pic, PicUploader

    serialize :pic, JSON

    validates :pic, presence: true
    validates :title, presence: true
    validates :body, presence: true


end

