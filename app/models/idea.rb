class Idea < ActiveRecord::Base
    belongs_to :topic
    mount_uploader :picture, PictureUploader

    def self.search(search)
      where("title ILIKE ?", "%#{search}%")
      where("text ILIKE ?", "% #{search} %")
    end
end
