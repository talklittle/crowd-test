class SessionsController < ApplicationController
  helper :all
  include SessionsHelper

  def new
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect user
    end
  end

  def destroy
  end

end
