# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
#

puts "Deleting old statuses"

Status.all.each { |s| s.delete }

puts "Deleted statuses"

puts "Creating statuses"

Status.create(status: "Je suis retard")
Status.create(status: "Je suis un peu retard")
Status.create(status: "Je ne suis pas retard")

puts "Done"
