class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :title
      t.string :biography
      t.string :photo, null: false 

      t.timestamps
    end
    add_index :doctors, :name, unique: true
  end
end
