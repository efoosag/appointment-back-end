class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :reserve_date
      t.string :city
      t.references :doctor, foreign_key: true
      t.references :user, foreign_key: true
      t.index [:user_id, :doctor_id], unique: true

      t.timestamps
    end
  end
end
