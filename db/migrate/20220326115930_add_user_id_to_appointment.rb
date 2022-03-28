class AddUserIdToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :user_id, :integer
    add_index :appointments, :user_id
  end
end
