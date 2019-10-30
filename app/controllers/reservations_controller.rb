class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy, :index]

  def index
    # @reservation = Reservation.where(user_id: current_user.id).where(menu_id: menu_id)
  end

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
