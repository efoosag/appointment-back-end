# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :doctor, class_name: 'Doctor'
  belongs_to :user, class_name: 'User'

  validates :reserve_date, :city, presence: true
end
