class CategoriesController < ApplicationController
  before_action :require_admin, except: %i[index show]
  before_action :set_category, only: %i[edit update show destory]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)
  end

  def show
    @articles = Article.joins(:categories).where(categories: { id: params[:id] }).paginate(page: params[:page], per_page: 4)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to categories_url
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category was successfully updated'
      redirect_to categories_url
    else
      render 'edit'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    unless logged_in? && current_user.admin?
      flash[:alert] = 'Only admins can perform that action'
      redirect_to categories_path
    end
  end
end
