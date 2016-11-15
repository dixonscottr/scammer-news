class CommentsController < ApplicationController

  def create
    require_user
    @article = Article.find_by(id: params[:article_id])
    if @article
      @comment = @article.comments.new(comment_params)
      @comment.commenter = current_user
      # byebug
      if @comment.save
        flash[:notice] = 'Your comment was submitted'
        redirect_to article_path(@article)
      else
        redirect_to @article
      end
    else
      redirect 404
    end
  end

  def edit
    require_user
    @article = Article.find_by(id: params[:article_id])
    @comment = Comment.find_by(id: params[:id])
    unless @article && @comment
      render_404
    end
  end

def update
  require_user
  @article = Article.find_by(id: params[:id])
  @comment = Comment.find_by(id: params[:id])
  if @article && @comment && owns_comment?(@comment)
    @comment.assign_attributes(comment_params)
    if @comment.save
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
  @comment = Comment.find_by(id: params[:id])
  if @article && @comment && owns_comment?(@comment)
    @comment.destroy
    flash[:notice] = "That you just deleted was great, but we understand"
    redirect_to @article
  end
end


  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
