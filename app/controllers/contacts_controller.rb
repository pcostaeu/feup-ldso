class ContactsController < ApplicationController
  def index
  end

  def new
    @contact = Contact.new
  end

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
  def contact_params
      params.require(:contact).permit(:name, :title, :email, :message)
  end

end
