class Api::V1::DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show destroy]

  def index
    render json: Doctor.all
  end

  def show
    if @doctor.blank?
      render json: { error: "Doctor with id #{params[:id]} does not exist" }, status: 404
    else
      render json: @doctor
    end
  end

  def create
    doctor = Doctor.new(doctor_params)
    doctor.age = age

    if doctor.save
      render json: doctor, status: 201
    else
      render json: { error: doctor.errors }, status: 422
    end
  end

  def destroy
    if @doctor.blank?
      render json: { error: "Doctor with id #{params[:id]} not found" }, status: 404
    else
      @doctor.delete
      render status: 204
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find_by_id(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :profile_pic, :date_of_birth,
                                   :experience, :consultation_fee, :bio)
  end

  def age
    now = Time.current
    dob = params[:doctor][:date_of_birth].to_time # change the string to time format
    now.year - dob.year - ((now.month > dob.month) || (now.month == dob.month && now.day >= dob.day) ? 0 : 1)
  end
end
