class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if current_user != @user
        redirect_to root_path
      else
        @reservation = @user.reservations.find_by(id: params[:id])
        @total_time = ReservationActivity.total_duration_for_reservation(@reservation.id)
        if @reservation.nil?
          redirect_to user_path(@user), alert: "Reservation not found"
        end
      end
    else
      redirect_to root_path
    end
  end

  def new
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if current_user != @user
        redirect_to root_path
      else
        @reservation = Reservation.new
        @reservation_activities = @reservation.reservation_activities.build
        @activities = Activity.all_except_custom
        @dogs = Dog.user_dogs(@user.id)
      end
    else
      redirect_to root_path
    end
  end

  def create
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if current_user != @user
        redirect_to root_path
      else
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
          redirect_to user_reservation_path(@user, @reservation), notice: "Reservation was successfully created"
        else
          @reservation_activities = @reservation.reservation_activities.build
          @activities = Activity.all_except_custom
          @dogs = Dog.user_dogs(@user.id)
          render :new
        end
      end
    else
      redirect_to root_path
    end
  end

  def edit
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if current_user != @user
        redirect_to root_path
      else
        @reservation = Reservation.find(params[:id])
        @activities = Activity.all
        @dogs = Dog.user_dogs(@user.id)
      end
    else
      redirect_to root_path
    end
  end

  def update
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if current_user != @user
        redirect_to root_path
      else
        @reservation = Reservation.find_by(id: params[:id])
        if @reservation.update(reservation_params)
          redirect_to user_reservation_path(@user, @reservation), notice: "Reservation was successfully updated"
        else
          @activities = Activity.all
          @dogs = Dog.user_dogs(@user.id)
          render :edit
        end
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    Reservation.find_by(id: params[:id]).destroy
    redirect_to user_path(current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :dog_id, :date, :drop_off_time, :pick_up_time, activity_ids: [], durations: {}, reservation_activities_attributes: [:duration, activities: [:name, :description, :best_for_type, :best_for_size, :energy_usage, :custom]])
  end
end
