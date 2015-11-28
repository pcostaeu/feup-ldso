class ReceivedContactsController < ApplicationController
  def index
     @received_contacts = Contact.where(seen: false)
     @received_contacts_read = Contact.where(seen: true)
  end

  def delete
    Contact.find(params[:id]).destroy
    redirect_to :back
  end

  def read
    @contact = Contact.find(params[:id])
    @contact.seen = true
    @contact.save
    redirect_to :back
  end
end
