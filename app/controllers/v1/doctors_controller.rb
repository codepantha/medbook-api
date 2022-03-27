class V1::DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show destroy]

  def index
    render json: Doctor.all
  end

  def show
    render json: @doctor
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end
