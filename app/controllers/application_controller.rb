class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActionView::MissingTemplate, :with => :template_not_found
  helper_method :current_user

	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id] 
	end
	def template_not_found
	    redirect_to new_session_path, alert: 'Not authorized to acces this content.'
	end
	def authenticate_user
		if !current_user
			redirect_to new_session_path, alert:'Did not met with the credentials...You need to login before you continue ....!'
		end
	end

end

