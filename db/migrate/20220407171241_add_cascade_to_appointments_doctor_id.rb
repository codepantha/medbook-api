class AddCascadeToAppointmentsDoctorId < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :appointments, :doctors
    add_foreign_key :appointments, :doctors, on_delete: :cascade
  end
end
