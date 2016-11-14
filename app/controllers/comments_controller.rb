class CommentsController < ApplicationController

  def create
    @article = Article.find_by(id: params[:article_id])
    if @article
      @comment = @article.comments.new(comment_params)
      @comment.commenter = current_user
      if @comment.save
        flash[:notice] = 'Your comment was submitted'
        redirect_to article_path(@article)
      else
        render 'articles/show'
      end
    else
      #redirect 404
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :link)
    end

end
