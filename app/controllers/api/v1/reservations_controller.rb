class Api::V1::ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.joins(:doctor).pluck(
      'reservations.id, doctors.name, reserve_date, city'
    )
    render json: @reservations
  end

   def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: { message: 'reservation added', status: :ok }
    else
      render json: { message: 'reservations not created' }, status: :unprocessable_entity
    end
  end


  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { message: 'reservation deleted', status: :ok }
    else
      render json: { message: 'reservation not found', status: :not_found }
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :doctor_id, :reserve_date, :city)
  end
end
