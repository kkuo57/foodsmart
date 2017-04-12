class UsersController < ApplicationController
  before_action :set_user,        only: [:show, :edit, :update, :destroy]
  before_action :is_current_user, only: [:show, :edit, :update, :destroy]
  
  def show
    @user=User.find_by_id(params[:id])
    if !logged_in?
      redirect_to root_path
    end
  end

  def new
    @user = User.new 
  end

  def edit
  end

  # POST
  def create
    @user = User.new(user_params)
    if params[:user][:password_confirmation] != user_params[:password]
      flash[:error] = "Passwords don't match"
      redirect_to new_user_path
    elsif user_params[:password].empty?
      flash[:error] = "Please enter a password"
      redirect_to new_user_path
    else
      if @user.save
        log_in(@user)
        flash[:success] = "User created successfully!"
        redirect_to user_path(@user)
      else
        flash[:error] = "Not Valid Account Info"
        redirect_to root_path
      end
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if params[:user][:password_confirmation] != user_params[:password]
      flash[:error] = "Passwords don't match"
      redirect_to edit_user_path(@user)
    elsif user_params[:password].empty?
      flash[:error] = "Please Enter a Password"
      redirect_to edit_user_path(@user)
    else
      @user.update(user_params)
      flash[:success] = "Profile Updated"
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User Deleted"
    redirect_to root_path
  end

  private
    def is_current_user
      @user = User.find_by_id(params[:id])
      if @user != current_user
        redirect_to root_path
      end
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :location, :password)
    end
end
