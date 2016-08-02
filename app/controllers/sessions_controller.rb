class SessionsController < ApplicationController

  def new
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end

  def create
  	@current_user = User.find_by_email(params[:session][:email])
  	
  	if @current_user && (@current_user.authenticate(params[:session][:password])) 
  	    session[:user_id] = @current_user.id
  	    flash[:notice] = "Welcome, #{@current_user.email}!"
  	    redirect_to statuses_path
  	else
  	#   session[:user_id] = nil
  	    flash[:alert] = "Please log in again"
  	    render :new
  	end
  end

  private

  def valid_params
   	params.require(:session).permit(:name, :email, :password, :password_confirmation)
  end
 
end
