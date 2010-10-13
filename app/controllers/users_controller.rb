class UsersController < ApplicationController
  before_filter :require_user
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  def ajaxreset
    @user = @current_user
    if @user.reset_single_access_token!
      flash[:notice] = "New token generated"
      render :update do |page|
        page.replace_html 'sat', :partial => 'token', :object => @user
      end
    else
      flash[:notice] = "Failed to create token"
    end
  end
end
