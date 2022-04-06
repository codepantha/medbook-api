class Api::V1::DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show destroy profile_pic]

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

  def profile_pic
    if @doctor&.profile_pic.attached?
      render json: url_for(@doctor.profile_pic), status: :ok
    else 
      render json: { error: "Doctor with id #{params[:id]} does not have a profile pic" }, status: 404
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find_by_id(params[:id])
  end

  def doctor_params
    params.permit(:name, :specialty, :profile_pic, :date_of_birth,
                                   :experience, :consultation_fee, :bio)
  end

  def age
    now = Time.current
    dob = params[:date_of_birth].to_time # change the string to time format
    now.year - dob.year - ((now.month > dob.month) || (now.month == dob.month && now.day >= dob.day) ? 0 : 1)
  end
end
