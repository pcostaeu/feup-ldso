class Topic < ActiveRecord::Base
  has_many :ideas
  mount_uploader :picture, TopicPictureUploader
end
