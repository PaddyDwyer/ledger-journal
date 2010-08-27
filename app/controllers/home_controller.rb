class HomeController < ApplicationController
  
  skip_before_filter :require_login, :except => [:home]
  
  def index
  end

end
