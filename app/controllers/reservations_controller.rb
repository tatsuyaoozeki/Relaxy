class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show]

  # def index
  #   @reservation = Reservation.where(user_id: current_user.id).where(menu_id: menu_id)
  # end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to menu_reservation_path(menu_id: @reservation.menu_id, id: @reservation), notice:"予約が完了しました"
    else
      render :new
    end
  end

  def show
    @menu = @reservation.menu
    @user = User.find(current_user.id)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :menu_id, :user_id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
