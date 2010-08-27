# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :require_login
  
  private
      def require_login
        logger.debug "login #{APP_CONFIG['perform_authentication']}"
        if APP_CONFIG['perform_authentication']
          unless heroku_user.logged_in?
            redirect_to "/login.html"
          end
        end
      end
end
