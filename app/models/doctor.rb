# frozen_string_literal: true

class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :title, presence: true
end
