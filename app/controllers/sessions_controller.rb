class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user, notice: 'Logged in successfully'
    else
      redirect_to login_path, alert: 'There was something wrong'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
