class SessionsController < ApplicationController
  respond_to :html, :json
  def create
    @user = User.authenticate(params[:session][:email], params[:session][:password])

   if @user
      create_user_session(@user)
      render :json => @user
      # respond_with @user, :notice => "Login succesful."
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      respond_to do |format|
        format.html { render 'new' }
        format.json { render :json => {:error => "Invalid email or password."} }
      end
    end
  end

  def destroy
    destroy_user_session
    redirect_to '/', :notice => "Logged out."
  end
end
