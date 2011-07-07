class AccountController < ApplicationController
  
  before_filter :logged_in?
  
  def show
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.update_attributes(params[:user])
    flash[:notice] = "Successfully update account info!"
    redirect_to '/account'
  end
  
end