class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(:created_at)
  end

  def new
    require_user
    @article = Article.new
  end

  def create
    require_user
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

  def edit
    require_user
    @article = Article.find_by(id: params[:id])
    unless @article
      render_404
    end
  end

  def update
    require_user
    @article = Article.find_by(id: params[:id])
    if @article && owns_article?(@article)
      @article.assign_attributes(article_params)
      if @article.save
        flash[:notice] = "Your edits were saved"
        redirect_to @article
      else
        render 'edit'
      end
    end
  end

  def destroy
    require_user
    @article = Article.find_by(id: params[:id])
    if @article && owns_article?(@article)
      @article.destroy
      flash[:notice] = "Your article was deleted and will be missed"
      redirect_to @article
    else
      render_404
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :link)
    end

end
