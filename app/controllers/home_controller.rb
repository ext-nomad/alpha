class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to user_path(current_user)
    else
      redirect_to login_path
    end
  end

  def about; end
end
