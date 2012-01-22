module SessionsHelper
  def sign_in(user)
     self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def deny_access
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end
 
  def authenticate
     deny_access unless signed_in?
  end

    private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
