# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

doctors = Doctor.create([
  
  {
    name: "John Doe",
    title: "Optimologist",
    biography: "A great optimologist",
    photo: "https://encrypted-tbn0.gs/"
   },
  
  {
    name: "Brian Lee",
    title: "gynaecologist",
    biography: "A great gynaecologist",
    photo: "https://encrypted-tbn0.gs/"
  },
  
  {
     name: "Sadah Hoe",
    title: "Dentist",
    biography: "A great Dentist",
    photo: "https://encrypted-tbn0.gs/"
  }
  ])

  reservation = Reservation.create([
    {
     reserve_date: "22/09/2022",
     city: "Lagos",
     doctor: doctors.first 
    },
    {
     reserve_date: "22/09/2022",
     city: "Londoon",
     doctor: doctors.first 
    }

  ])