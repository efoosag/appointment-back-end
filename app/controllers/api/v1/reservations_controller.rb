class Api::V1::ReservationsController < ApplicationController
  # before_action :set_reservation, only: %i[show destroy]

  # def index
  #    reservations = Reservation.all
  #    render json: ReservationSerializer.new(reservations).serializable_hash.to_json(joins: :doctor)
  # end
  def index
    @reservations = Reservation.joins(:doctor).pluck(
      'reservations.id, doctors.name, reserve_date, city'
    )
    render json: @reservations
  end

  # def create
  #   reservation = Reservation.new(reservation_params)
  #   if reservation.save
  #     render json: { data: 'Created Reservation Successfully', status: :ok }
  #   else
  #     render json: reservation.errors.full_messages, status: :unprocessable_entity
  #   end
  # end

  def create
    @reservations = Reservation.new(reservation_params)
    @reservations.user = current_user
    if @reservations.save
      render json: { message: 'reservation added', status: :created }
    else
      render json: { message: 'reservations not created' }, status: :unprocessable_entity
    end
  end

  # def destroy
  #   if reservation.destroy
  #     render json: { data: 'Deleted Reservation Successfully', status: :ok }
  #   else
  #     render json: { data: 'Successfully went wrong', status: 'failed' }
  #   end
  # end
  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { message: 'reservation deleted', status: :ok }
    else
      render json: { message: 'reservation not found', status: :not_found }
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
