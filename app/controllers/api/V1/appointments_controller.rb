class Api::V1::AppointmentsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])

    if @user.nil?
      render json: { status: 'error', message: 'Appointments for this user do not exist' }
    else
      appointments = @user.appointments
      render json: { status: 'Success', message: 'Appointments fetched successfully', data: appointments }, status: :ok

    end
  end

  def create
    appointment = Appointment.new(appointment_params)

    if appointment.save
      render json: { status: 'Success', message: 'Appointment created successfully', data: appointment },
             status: :ok
    else
      render json: { status: 'ERROR', message: 'Appointment not saved', data: appointment.errors },
             status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.permit(:appointment_date, :city, :user_id, :doctor_id)
  end
end
