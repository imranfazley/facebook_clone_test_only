class LikesController < ApplicationController

  def create
  	# user = User.find(params[:user_id])
    like = Like.find_by(:user_id => params[:like][:user], :status_id => params[:like][:status])
  	if like.present?
  	# 	# its a duplicate
  		flash[:alert] = "You liked before!"
  	else 
  	# 	# its a new like
	  	like = Like.create(user_id: params[:like][:user], status_id: params[:like][:status])
			status = like.status
			flash[:notice] = "You liked #{status.title}!" 
		end
  	redirect_to root_path
  end

  def destroy
  	like = Like.find(params[:id])
  	like.destroy
  	flash[:notice] = "You unlike."
  	redirect_to status_path(like.status.id)
  end

end
