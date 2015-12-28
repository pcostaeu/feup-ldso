class Idea < ActiveRecord::Base
    belongs_to :topic
    mount_uploader :picture, PictureUploader
end
