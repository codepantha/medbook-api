class RemoveDoctorProfilePicUrl < ActiveRecord::Migration[7.0]
  def change
    remove_column :doctors, :profile_pic
  end
end
