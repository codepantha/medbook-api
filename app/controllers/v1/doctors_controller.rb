class V1::DoctorsController < ApplicationController
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

  def set_doctor
    @doctor = Doctor.find_by_id(params[:id])
  end
end
