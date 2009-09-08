# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :current_card, :logged_in?
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  protected
  
  def current_card
    @current_card||=session[:card] && Card.find_by_key( session[:card])
  end
  
  def logged_in?
    current_card!=nil
  end
end
