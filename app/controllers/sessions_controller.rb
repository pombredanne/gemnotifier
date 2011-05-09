class SessionsController < ApplicationController

  def create
    auth = request.env['rack.auth']
    unless @auth = Authorization.from_auth(auth)
      @auth = Authorization.create_from_auth(auth)
    end
    flash[:notice] = "Successfully sign in from github!"
    self.current_user = @auth.user
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
  
end
