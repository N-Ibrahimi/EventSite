# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Event.destroy_all
Attendance.destroy_all


6.times do
  User.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, email: Faker::Internet.unique.email, description: Faker::Lorem.characters(25))
end

10.times do
  Event.create!(admin_id: User.all.sample.id, location: "Paris", price: rand(1..1000), title: Faker::Lorem.characters(10), description: Faker::Lorem.characters(25), duration: rand(1..10)*5, start_date: Time.now + 1.day)
end

5.times do
  event = Event.all.sample
  Attendance.create!(event_id: Event.all.sample.id, attendee_id: User.all.sample.id)
end
