class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_filter :login_required, only: [:index, :new, :create, :update, :destroy]

  def index
    @admin = Admin.new
  end

  def create
    if !Admin.where(email: admin_params[:email]).blank?
      flash[:alert] = 'Email inserido já tem conta'
      @admin = Admin.new
      render :index
    elsif (admin_params[:password] != admin_params[:password_confirmation])
      flash[:alert] = 'Passwords diferentes'
      @admin = Admin.new
      render :index
    else
      @admin = Admin.new(admin_params)
      respond_to do |format|
        if @admin.save
          format.html { redirect_to index }
        else
          format.html { render :index }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to index }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url }
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
