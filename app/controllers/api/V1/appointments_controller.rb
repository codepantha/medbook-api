class Api::V1::AppointmentsController < ApplicationController
    def index
       @appointments = Appointment.all
       render json: { status: "Success", message: "Appointment fetched successfully", data: @appointments}
    end
end