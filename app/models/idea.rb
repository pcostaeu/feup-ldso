class Idea < ActiveRecord::Base
    belongs_to :topic
    mount_uploader :picture, PictureUploader

    def self.search(search)       
        where("title ILIKE ? OR text ILIKE ? OR author ILIKE ?", "%#{search}%","%#{search}%","%#{search}%")     
    end
    
         def self.search_by_month(month)
        where('extract(month from created_at) = ? ', month)
    end
end
