class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to @article
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
