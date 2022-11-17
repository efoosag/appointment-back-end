class Api::V1::DoctorsController < ApplicationController
  # before_action :set_doctor, only: %i[show destroy]

  def index
    doctors = Doctor.all
    render json: DoctorSerializer.new(doctors).serializable_hash.to_json
  end

  def show
    doctor = Doctor.find(params[:id])
    # render json: @doctor, status: :ok
    render json: DoctorSerializer.new(doctor).serializable_hash.to_json
  end


  def create
    doctor = Doctor.new(doctor_params)
    @doctor.photo = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fmedical-doctor&psig=AOvVaw2hlddqpN7HIZBVqqA0ILWV&ust=1667655781842000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjA24XUlPsCFQAAAAAdAAAAABAE' if doctor.photo.nil?
    if doctor.save
      render json: { data: 'Created Doctor Successfully', status: :ok }
    else
      render json: { data: doctor.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end
  end

  def destroy
    if @doctor.destroy
      render json: { data: 'Deleted Doctor Successfully', status: :ok }
    else
      render json: { data: 'Successfully went wrong', status: 'failed' }
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :title, :photo, :biography)
  end    
end
