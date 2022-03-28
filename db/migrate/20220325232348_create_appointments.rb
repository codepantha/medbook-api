class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.string :city

      t.timestamps
    end
  end
end
