class Topic < ActiveRecord::Base
  has_many :ideas

  validates_presence_of :picture, message: "Imagem obrigatória"
  validates_presence_of :name, message: "Nome da categoria obrigatório"

  mount_uploader :picture, TopicPictureUploader
end
