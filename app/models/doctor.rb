class Doctor < ApplicationRecord
  validates :name, presence: { message: 'is a required field' }
  validates :specialty, presence: { message: 'is a required field' }
  validates :date_of_birth, presence: { message: 'is a required field' }
  validates :experience, presence: { message: 'is a required field' }
  validates :experience, numericality: { only_integer: true }
  validates :consultation_fee, presence: { message: 'is a required field' }
  validates :consultation_fee, numericality: true
  has_one_attached :profile_pic

  has_many :appointments
end
