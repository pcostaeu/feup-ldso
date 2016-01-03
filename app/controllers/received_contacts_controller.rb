class ReceivedContactsController < ApplicationController
  # before_filter - prevents acess without login made
  before_filter :login_required, only: [:index, :delete, :read]

  # Selects from database all contacts already submited by users
  def index
    @received_contacts = Contact.where(seen: false)
    @received_contacts_read = Contact.where(seen: true)
  end

  # Deletes from database a message from users
  def delete
    Contact.find(params[:id]).destroy
    redirect_to :back
  end

  # Marks as read a message
  def read
    @contact = Contact.find(params[:id])
    @contact.seen = true
    @contact.save
    redirect_to :back
  end
end
