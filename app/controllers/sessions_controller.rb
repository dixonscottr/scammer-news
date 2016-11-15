class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      flash[:notice] = "Welcome to the site, your presence is valued"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  def destroy
    session.clear
    flash[:notice] = 'You are logged out and will be missed'
    redirect_to '/'
  end

  private
    def inputted_username
      params.permit(:username)
    end

    def inputted_password
      params.permit(:password)
    end
end
