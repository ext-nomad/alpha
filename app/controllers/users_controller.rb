class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]
  before_action :require_user, except: %i[show index new create]
  before_action :require_same_user, only: %i[edit update destroy]

  def show
    @articles = Article.where(user: @user).paginate(page: params[:page], per_page: 2)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to articles_path, notice: "#{@user.username.capitalize} welcome to the Alpha Blog!"
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Your account successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    redirect_to root_path, notice: 'User successfully deleted.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    unless current_user == @user && current_user.admin?
      redirect_to @user, alert: 'You can only edit or delete your own profile'
    end
  end
end
