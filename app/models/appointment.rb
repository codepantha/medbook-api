class Appointment < ApplicationRecord
    validates :appointment_date, presence: true
    validates :city, presence: true
end
