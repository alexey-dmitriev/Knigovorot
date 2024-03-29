class SessionsController < ApplicationController
  def new
  @title = "Sign in"
  end
 
  def create
     user = User.find_by_email(params[:session][:email])
     if user && user.authenticate(params[:session][:password])
       session[:user_id] = user.id
       redirect_to root_path, :notice => "Logged in!"
       sign_in user
     else
       flash.now.alert = "Invalid email or password"
       render "new"
     end
  end

  def destroy
     session[:user_id] = nil
     redirect_to root_path, :notice => "Logged out!"
  end

end
