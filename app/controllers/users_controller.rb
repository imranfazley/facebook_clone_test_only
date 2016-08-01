class UsersController < ApplicationController
 
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(valid_params)
  	if @user.save
  	  flash[:notice] = "Account created. Please log in now."
  	  redirect_to User.last
  	else
  	  flash[:alert] = "Error creating account: "
  	  render :new
  	end
  end

  def update
    @user = User.find_by(params[:name])
    if @user.update(valid_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "Account is updated successfully."
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
  	User.find(params[:id]).destroy
  	flash[:notice] = "Account is deleted"
  	redirect_to statuses_path
  end

  private

  def valid_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
