class ReceivedContactsController < ApplicationController
  def index
     @received_contacts = Contact.all
  end
end
