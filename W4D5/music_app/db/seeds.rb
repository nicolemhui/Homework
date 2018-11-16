# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.destroy_all

band1 = Band.create(name: "Backstreet Boys")
band2 = Band.create(name: "NSYNC")
band3 = Band.create(name: "Taking Back Sunday")
band4 = Band.create(name: "Red Hot Chili Peppers")
band5 = Band.create(name: "Boyz II Men")
