class Fashion < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy 
    has_many :liking_users, through: :likes, source: :user
    

    mount_uploaders :pic, PicUploader

    serialize :pic, JSON

    validates :title, presence: true, length: {maximum: 20}
    validates :body, presence: true, length: {maximum: 50}

end

