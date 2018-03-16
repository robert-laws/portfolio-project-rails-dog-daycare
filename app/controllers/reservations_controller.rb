class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    if params[:user_id]
      @user = User.find(params[:user_id])
      if current_user != @user
        redirect_to root_path
      else
        @reservation = @user.reservations.find_by(id: params[:id])
        if @reservation.nil?
          redirect_to user_path(@user), alert: "Reservation not found"
        end
      end
    else
      redirect_to root_path
    end
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end
end
