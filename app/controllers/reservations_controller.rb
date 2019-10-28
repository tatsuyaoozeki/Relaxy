class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show]

  def index
    @reservations = Reservation.all.reverse
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to root_path notice:"予約が完了しました"
  end

  def show
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to
    else
      render
    end
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :menu_id, :user_id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
