module Api
  module V1
    class DoctorsController < ApplicationController
      before_action :set_doctor, only: %i[show destroy]
      def index
        @doctors = Doctor.all
        render json: @doctors
      end

      def show
        render json: @doctor, status: :ok
      end

      def create
        @doctor = Doctor.new(doctor_params)
        if @doctor.photo.nil?
          @doctor.photo = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fmedical-doctor&psig=AOvVaw2hlddqpN7HIZBVqqA0ILWV&ust=1667655781842000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjA24XUlPsCFQAAAAAdAAAAABAE'
        end
        if @doctor.save
          render json: { data: 'Created Doctor Successfully', status: :ok }
        else
          render json: { data: @doctor.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
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
  end
end
