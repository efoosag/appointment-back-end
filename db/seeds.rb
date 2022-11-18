# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

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

reservations = Reservation.create([
                                    {
                                      reserve_date: DateTime.new(2015, 6, 22),
                                      city: "Lagos",
                                      doctor: doctors.first,
                                      user_id: 2
                                    },
                                    {
                                      reserve_date: DateTime.new(2016, 6, 22),
                                      city: "Londoon",
                                      doctor: doctors.first,
                                      user_id: 2
                                    }
                                  ])
