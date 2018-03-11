class AddressesController < ApplicationController
  def show
    if params[:user_id]
      @user = User.find(params[:user_id])
      if current_user != @user
        redirect_to root_path
      else
        @address = @user.addresses.find_by(id: params[:id])
        if @address.nil?
          redirect_to user_path(@user), alert: "Address not found"
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
        @address = @user.addresses.find_by(id: params[:id])
        if @address.nil?
          redirect_to user_path(@user), alert: "Address not found"
        end
      end
    else
      redirect_to root_path
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_path(@address.user), notice: "Address updated successfully"
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:street_1, :street_2, :city, :state, :zip_code)
  end
end
