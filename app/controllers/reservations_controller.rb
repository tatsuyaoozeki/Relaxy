class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show]

  def index
    @reservations = Reservation.all.reverse
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to menu_reservations_path(@reservation.id), notice:"予約が完了しました"
    else
      render :new
    end
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

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :menu_id, :user_id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
