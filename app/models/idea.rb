class Idea < ActiveRecord::Base
    belongs_to :topic
    mount_uploader :picture, PictureUploader

    validates_presence_of :title, message: "Título obrigatório"
    validates_presence_of :text, message: "Corpo da ideia obrigatório"

    def self.search(search)
        where("title ILIKE ? OR text ILIKE ?", "%#{search}%","%#{search}%")
    end

    def self.search_by_month(month)
        where('extract(month from created_at) = ? ', month)
    end
    def self.not_concretize()
        joins('LEFT JOIN "concretize_ideas" ON "ideas"."id" = "concretize_ideas"."idea_id"').where('"concretize_ideas"."idea_id" is null')
    end
end
