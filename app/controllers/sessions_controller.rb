class SessionsController < ApplicationController
  def new
    if logged_in?
     redirect_to root_url, :notice => "You are already logged in!"
    end
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end

  def forgot_password
    @user = User.find_by_email(params[:email])
    if user
      # send email
    else
      flash.now[:alert] = "Invalid e-mail."
    end
  end
end
