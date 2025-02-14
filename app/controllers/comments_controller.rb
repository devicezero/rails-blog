class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)

    Prometheus::Counter.new(
      name: 'comments_controller_create_total',
      help: 'Total number of requests to the comments create action'
    ).increment
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
