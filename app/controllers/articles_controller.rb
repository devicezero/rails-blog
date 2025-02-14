class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    Prometheus::Counter.new(
      name: 'articles_controller_index_requests_total',
      help: 'Total number of requests to the articles action'
    ).increment
  end

  def show
    @article = Article.find(params[:id])
  end
end
