# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


client_1 = Client.create(name: 'Aiste', age: 18, email: 'aiste@aiste.ca', start_date: 2015-04-01, active: true )
client_2 = Client.create(name: 'Bob', age: 22, email: 'aiste+1@gmail.com', start_date: 2015-03-17, active: true )
client_3 = Client.create(name: 'Rose', age: 65, email: 'aiste+3@gmail.com', start_date: 2015-02-11, active: false )
client_4 = Client.create(name: 'Bryan', age: 31, email: 'aiste+5@gmail.com', start_date: 2014-04-01, active: true )