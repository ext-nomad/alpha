class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 4)
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = 'Article successfully created.'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article successfully updated.'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article successfully deleted.'
    redirect_to articles_path
  end

  private

  # Setting active object :article based on it's given :id from params
  def set_article
    @article = Article.find(params[:id])
  end

  # Returns permitted article params: :title, :description
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
