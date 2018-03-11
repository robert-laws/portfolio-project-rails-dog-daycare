class DogsController < ApplicationController
  def show
    if params[:user_id]
      @user = User.find(params[:user_id])
      if current_user != @user
        redirect_to root_path
      else
        @dog = @user.dogs.find_by(id: params[:id])
        if @dog.nil?
          redirect_to user_path(@user), alert: "Dog not found"
        end
      end
    else
      redirect_to root_path
    end
  end

  def edit
    if params[:user_id]
      @user = User.find(params[:user_id])
      if current_user != @user
        redirect_to root_path
      else
        @dog = @user.dogs.find_by(id: params[:id])
        if @dog.nil?
          redirect_to user_path(@user), alert: "Dog not found"
        end
      end
    else
      redirect_to root_path
    end
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      redirect_to user_path(@dog.user), notice: "Dog updated successfully"
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:dog).permit(:name, :breed, :age, :sex)
  end
end
