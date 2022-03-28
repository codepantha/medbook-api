class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :profile_pic
      t.string :specialty
      t.datetime :date_of_birth
      t.integer :age
      t.text :bio
      t.integer :experience
      t.decimal :consultation_fee

      t.timestamps
    end
  end
end
