class UsersController < ApplicationController
  respond_to :html, :json
  def index
    @users = User.all
    render :json => @users
    # respond_with(@users)
  end

  def new
     @user = User.new
  end

  def update
     @user = User.find( params[:id] )
     render action: :show, :json => { :message => "User successfully created" }, :status => 200
  end

  def show
      @user = User.find(params[:id])
    end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
      flash[:sucess] = "Welcome User"    
      render :json => @user
      # respond_with(@user)
    else
      render :new
    end
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
