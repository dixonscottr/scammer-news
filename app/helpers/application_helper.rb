module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def owns_article?(article)
    article.author == current_user
  end

  def owns_comment?(comment)
    comment.commenter == current_user
  end

end
