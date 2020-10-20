class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]
  before_action :require_user, except: %i[show index]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 10)
  end

  def show
    @comment = Comment.new
    @comments = @article.comments
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to articles_path, notice: 'Article successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: 'Article successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Article successfully deleted.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    unless current_user == @article.user && current_user.admin?
      redirect_to @article, alert: 'You can only edit or delete your own articles'
    end
  end
end
