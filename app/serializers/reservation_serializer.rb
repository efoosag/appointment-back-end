class ReservationSerializer
  include JSONAPI::Serializer
  attributes :reserve_date, :city, :doctor.name

  belongs_to :doctor
end
