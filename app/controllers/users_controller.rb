class UsersController < ApplicationController
  before_action :require_permission, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show

    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:profile] = true
      redirect_to edit_user_path(@user), notice: "Your account was successfully created. Please take a moment to add some additional information"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      session[:profile] = false
      redirect_to user_path(@user), notice: "Your profile has been updated successfully"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, addresses_attributes: [:id, :street_1, :street_2, :city, :state, :zip_code], dogs_attributes: [:id, :name, :breed, :age, :sex])
  end
end