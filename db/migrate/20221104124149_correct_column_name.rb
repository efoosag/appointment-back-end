class CorrectColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :resrve_date, :reserve_date
  end
end
