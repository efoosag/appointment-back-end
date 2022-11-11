class DoctorSerializer
  include JSONAPI::Serializer
  attributes :name, :title, :biography, :photo

  has_many :reservation
end
