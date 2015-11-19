class Contact < ActiveRecord::Base
  validates_presence_of :name, message: "Nome obrigatório"
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "Email obrigatório" }
  validates_presence_of :title, message: "Assunto obrigatório"
  validates_presence_of :message, message: "Mensagem obrigatória"
end
