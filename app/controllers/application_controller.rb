class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:user_id]
  end

  def require_user
    redirect_to '/' unless logged_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def render_404
    render file: "/public/404.html", status: 404
  end

  def owns_article?(article)
    article.author == current_user
  end

  def owns_comment?(comment)
    comment.commenter == current_user
  end

end
