class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # this is to make there methods available to the views to be used.
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||=  Chef.find(session[:id]) if session[:id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "you must be logged in to perform this action"
      redirect_to :back
    end
  end

end
