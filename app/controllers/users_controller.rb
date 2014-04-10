class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    # @users = User.all
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
    @whitelist = @user.whitelists.all
  end

  def create
    @user = User.new(secure_params)
    if @user.save
    #if @user.valid?
    sign_in @user
      @user.subscribe
      #flash[:notice] = "Signed up #{@user.email}."
      #redirect_to root_path
      redirect_to @user
    else
      render :new
    end
  end
  
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        p 111111111111
        p  @user.errors.inspect
        render 'edit'
      end
  end
  
  private
  
  def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :tel, :validemail, :jamba, :cases)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :tel, :birthday, :ssn)
  end
  


end