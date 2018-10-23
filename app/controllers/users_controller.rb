class UsersController < ApplicationController
	#before_action :set_user, only: [:edit, :update, :destroy]
	#before_action :ensure_login, only: [:edit, :update, :destroy]
	#before_action :euthorize_user, only: [:edit, :update, :destroy]

	def index
		# list of user's entered locations
		@user = User.find(params[:id])
		@locations = @user.locations
		redirect_to user_locations_path(current_user)
	end

	 def show
	 	#user's (show of) specific location 
  		@user = User.find(params[:id])
     	@locations = @user.locations 
     	#@location = @user.location
     	#redirect_to user_locations_path(current_user)
    end

    def new
    	#sign up
		@user = User.new
	end


	def create
	    @user = User.new(user_params)
	    if @user.save
	      session[:user_id] = @user.id
	      flash.now[:notice] = "You are signed up"
	      redirect_to user_path(@user)
	    else
		  flash.now[:notice] = "Unable to create account."
	      render 'new'
	    end
  	end

 

private

    def user_params
    	params.require(:user).permit(:username, :password, :location_address)
  	end

  	
 end


