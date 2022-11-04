class Reservation < ApplicationRecord
  belongs_to :Doctor, class_name: 'Doctor'
  belongs_to :user, class_name: 'User'

  validates :reserve_date, :city, presence: true
end
