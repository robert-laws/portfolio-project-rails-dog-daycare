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

  end
end
