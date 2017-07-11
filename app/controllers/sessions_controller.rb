class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      #Save the user id inside the browser cookie. this is how we keep the user
      #logged in when they nevigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
      @error = 'Login failed'
      #if yser's login doesn't work, send them back to the login form.
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
