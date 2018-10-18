class ApplicationController < ActionController::Base
protect_from_forgery with: :exception

helper_method :logged_in?, :current_user


	def current_user
    	User.find_by(id: session[:user_id]) if session[:user_id]
  	end

	def logged_in?
		session[:user_id]
	end

	def ensure_login 
		unless session.include? :user_id
      		redirect_to '/'
      	flash[:message] = "Please sign up or log in!"
    end
	end


end



