class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:article_id])
    @comment.article_id = @article.id
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to article_path(@article), notice: 'Comment was successfully created.'
    else
      redirect_to article_path(@article), alert: 'Something is missing.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = Article.find(params[:article_id])
    @comment.destroy
    redirect_to article_path(@article), notice: 'Comment was successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
