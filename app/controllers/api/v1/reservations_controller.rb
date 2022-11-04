class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy]
  def index
    @reservations = current_user.reservations.to_json(include: :doctor)
    render json: @reservations
  end

  def show
    render json: @reservation.to_json(include: :doctor)
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      render json: { data: 'Created Reservation Successfully', status: :ok }
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @reservation.destroy
      render json: { data: 'Deleted Reservation Successfully', status: :ok }
    else
      render json: { data: 'Successfully went wrong', status: 'failed' }
    end
  end

  private

  def set_reservation
    @reservation = current_user.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:reserve_date, :city, :doctor_id)
  end
end
