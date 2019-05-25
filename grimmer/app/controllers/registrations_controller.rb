class RegistrationsController < ApplicationController



  def create
    #complete this method
    @user = User.new(registrations_params)
    if @user.save
      session[:current_user_id] = @user.id
      flash[:notice] = "Registration correct"
      redirect_to :LogIn

    else

      flash[:notice] = "Incorrect registration, try again"
      redirect_to registrations_url #veeeeeer falta crear esta ruta
    end
  end
  def registrations_params
    params.require(:registrations).permit(:name, :nickname, :email, :country, :city, :biography, :password, :photo, :location)
  end
end
