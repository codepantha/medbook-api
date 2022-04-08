class Appointment < ApplicationRecord
  validates :appointment_date, presence: true
  validates :city, presence: true

  belongs_to :user
  belongs_to :doctor
end
