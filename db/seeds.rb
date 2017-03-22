# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Room.create(name:"room 1", capacity: 15, rate_per_hour: 500.00, unit:5)
Room.create(name:"room 2", capacity: 8, rate_per_hour: 300.00, unit:3)
Room.create(name:"room 3", capacity: 6, rate_per_hour: 250.00, unit:5)
Room.create(name:"room 4", capacity: 5, rate_per_hour: 400.00, unit:1)
Room.create(name:"room 5", capacity: 1, rate_per_hour: 100.00, unit:1)

Room.create(name:"room 6", capacity: 15, rate_per_hour: 1500.00, unit:5)
Room.create(name:"room 7", capacity: 8, rate_per_hour: 1300.00, unit:3)
Room.create(name:"room 8", capacity: 2, rate_per_hour: 650.00, unit:5)
Room.create(name:"room 9", capacity: 7, rate_per_hour: 700.00, unit:1)
Room.create(name:"room 10", capacity: 6, rate_per_hour: 1000.00, unit:1)
