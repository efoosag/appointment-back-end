class AddUserDoctor < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :user, foreign_key: true
    add_reference :reservations, :doctor, foreign_key: true
  end
end
