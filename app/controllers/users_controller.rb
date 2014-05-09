class UsersController < ApplicationController
  before_action :admin_user, only: :destroy

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    if current_user.admin?
      @users = User.not_admins
    else
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to(root_path)
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user.admin?
      @user= User.find(params[:id])
    else
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to(root_path)
    end
  end

  # GET /users/new
  def new
    if current_user.admin?
      @user = User.new
    else
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to(root_path)
    end
  end

  # GET /users/1/edit
  def edit
    if current_user.admin?
      @user= User.find(params[:id])
    else
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to(root_path)
    end
  end

  # POST /users
  # POST /users.json
  def create
    if current_user.admin?
      @user = User.new(user_params)
      if @user.save
        ## don't want to automatically sign in right after registration
        #sign_in @user
        flash[:success]="New User Account Created"   
        redirect_to @user
      else
        render 'new'
      end
    else
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to(root_path)
    end
    
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if current_user.admin?
      if @user.update(user_params)
        flash[:success] = "Profile Updated"
        #sign_in @user
        redirect_to @user
      else
        render 'edit'
      end
    else
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to(root_path)
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted."
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
   

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user.admin?
    end
   
    # if(current_user?(@user))
     #   @user = User.find(params[:id])
      #  else
       #   flash[:error] = 'You are not authorized to edit the information!'
       # redirect_to(root_path)
      # end
    # end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def authenticate_admin_user!
        authenticate_user! 
    unless current_user.admin?
        flash[:alert] = "This area is restricted to administrators only."
        redirect_to root_path 
      end
    end
 
    def current_admin_user
      return nil if user_signed_in? && !current_user.admin?
      current_user
    end

end