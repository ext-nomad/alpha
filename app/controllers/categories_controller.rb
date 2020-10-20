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
      redirect_to categories_url, notice: 'Category was successfully created'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_url, notice: 'Category was successfully updated'
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
    redirect_to categories_path, alert: 'Only admins can perform that action' unless logged_in? && current_user.admin?
  end
end
