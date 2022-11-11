class ReservationSerializer
  include JSONAPI::Serializer
  attributes :reserve_date, :city, :doctor_id
end
