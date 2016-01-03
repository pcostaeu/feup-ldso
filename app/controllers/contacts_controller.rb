class ContactsController < ApplicationController
  def index
  end

  def new
  end

  # After submit, contact is created with parameters necessary and is saved to database
  def create
    @contact = Contact.new(contact_params)
    @contact.date = Time.zone.now.to_date
    @contact.seen = false
    if @contact.save
      redirect_to (contacts_path)
    else
      render 'index'
    end
  end

  private

  # parameters necessary to submit a new contact, prevents attemps of submiting other stuff that we dont want
  def contact_params
    params.require(:contact).permit(:name, :title, :email, :message)
  end
end
