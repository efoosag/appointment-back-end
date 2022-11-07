class Doctor < ApplicationRecord
  has_many :reservations, foreign_key: :doctor_id, dependent: :delete_all
  validates :name, :title, :biography, presence: true
end
