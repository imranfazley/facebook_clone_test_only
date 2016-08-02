class StatusesController < ApplicationController
before_action :set_params, only: [:update, :destroy]
  def new
  	@status = Status.new
  end

  def create
  	@current_user = User.find_by_email(params[:email])

  	if ((params[:status][:title]).length >= 8) && ((params[:status][:content]).length >= 10)
  		@status = Status.create(status_params)
  		flash[:notice] = "Status is created successfully."
  		redirect_to status_path(@status.id)
  	else
  		flash[:alert] = "Error creating status."
  		render :new
  	end

  end

  def update
  	if @status.update(status_params)
  		flash[:notice] = "Status is updated successfully."
  		redirect_to status_path(@status.id)
  	else
  		render :edit
  	end
  		
  end

  def edit
  end

  def destroy
  	@status.destroy
  	flash[:notice] = "Status is deleted."
  	redirect_to statuses_path
  end

  private

  def status_params
  	params.require(:status).permit(:title, :content)
  end

  def set_params
  		@status = Status.find(params[:id])
  end

end
