class ContactsController < ApplicationController
  def index
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.date = Time.zone.now.to_date
    @contact.seen = false
    @contact.save
    redirect_to (contacts_path)
  end

  private
  def contact_params
      params.require(:contact).permit(:name, :title, :email, :message)
  end

end
