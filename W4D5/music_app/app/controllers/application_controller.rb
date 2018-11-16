class ApplicationController < ActionController::Base
  helper_method :current_user

  #find by session token instead of params (email/pw)
  #find_by will query the db, assign inst. var to prevent querying multiple times
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    # @current_user ||= User.find_by_credentials(params[:user][:email], params[:user][:password])
  end

  #returns boolean if someone is logged in
  def logged_in?
    !current_user.nil? 
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    session[:session_token] = nil
    if current_user
      @current_user.reset_session_token!
    end
    @current_user = nil
  end
end
