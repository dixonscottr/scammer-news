class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(:created_at)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user
    if @article.save
      flash[:notice] = 'Thank you for your thoughtful link'
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
    @comment = Comment.new(article: @article)
    if @article
      render 'show'
    else
      render_404
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :link)
    end

end
