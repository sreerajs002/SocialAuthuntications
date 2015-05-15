class SessionsController < ApplicationController
  def create
    if params[:email] && params[:password]
    user = User.authenticate(params[:email], params[:password]) 
    else
    user = User.from_omniauth(env["omniauth.auth"])
    end
    if user
      temp = user.uid+'@'+user.provider+'.com' if  user.uid && user.provider
      if user.email== temp
      # session[:user_id] = user.id
      # redirect_to cities_url
      redirect_to edit_user_path(user), notice:'finish sign up'
      else
      session[:user_id] = user.id
      redirect_to cities_url, notice:'successfully signed in'
      end
    else
      redirect_to new_session_path, alert:'insufficient credentials'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice:'you are succesfully loged out....!'
  end
end
# class SessionsController < ApplicationController
# def new
# end

# def create

	
  	
#   		user = User.authenticate(params[:email], params[:password]) if params[:email] && params[:password]
#  #  	else
#  #      auth = request.env["omniauth.auth"]
# 	# user = User.where(:provider => auth['provider'], :uid => auth['uid']).first || User.create_with_omniauth(auth)

#  #  	end
#   if user
#     session[:user_id] = user.id
#     redirect_to cities_url, :notice => "Logged in!"
#   else
#     redirect_to new_session_path, :alert => "Invalid email or password"
    
#   end
# end

# def destroy
#   session[:user_id] = nil
#   reset_session
#   redirect_to root_url, :notice => "Logged out!"
# end
# end

