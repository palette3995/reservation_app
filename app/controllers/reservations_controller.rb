class ReservationsController < ApplicationController
before_action :authenticate_user!
  def index
    @reservations = current_user.reservations.all.order(updated_at: 'DESC')
  end

  def confirm_new
    @reservation = current_user.reservations.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    render 'rooms/show' unless @reservation.valid?
    # binding.pry
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    render 'rooms/show' and return if params[:back] || !@reservation.save
    redirect_to @reservation
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:room_id, :user_id, :check_in, :check_out, :customer, :total_amount, :total_day)
  end

end
