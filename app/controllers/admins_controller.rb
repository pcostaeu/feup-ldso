class AdminsController < ApplicationController
  # before_filter - prevents acess without login made
  before_filter :login_required, only: [:index, :new, :create, :update, :destroy]

  def index
  end

  # Creates a new admin, checks if params are corrects and if it is, saves to database
  def create
    if !Admin.where(email: admin_params[:email]).blank?
      flash[:alertC] = 'Email inserido já tem conta'
      render :index
    elsif (admin_params[:password] != admin_params[:password_confirmation])
      flash[:alertC] = 'Passwords diferentes'
      render :index
    else
      @admin = Admin.new(admin_params)
      if @admin.save
        redirect_to admins_path
      else
        render :index
      end
    end
  end

  # Updates admin password
  def update
    @admin = Admin.find(session[:admin_id])
    if (update_params[:password] != update_params[:password_confirmation])
      flash[:alertU] = 'Passwords diferentes'
      render :index
    else
      if @admin.update(update_params)
        redirect_to admins_path
      else
        render :index
      end
    end
  end

  # Deletes an admin account
  def destroy
    Admin.find(params[:id]).destroy
    redirect_to admins_url
  end

  private

  # parameters necessary to make password update, prevents attemps of submiting other stuff that we dont want
  def update_params
    params.require(:admin).permit(:password, :password_confirmation)
  end

  # parameters necessary to make create a new admin, prevents attemps of submiting other stuff that we dont want
  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
