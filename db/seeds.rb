
User.destroy_all
Event.destroy_all
Attendance.destroy_all


10.times do
  User.create!(
    first_name: Faker::Name.unique.first_name, 
    last_name: Faker::Name.unique.last_name, 
    email: Faker::Internet.unique.email, 
    description: Faker::Lorem.characters(25)
    )
  print '.'
end
puts '=== Users DB created ==='

10.times do
  Event.create!(
    admin_id: User.all.sample.id, 
    location: "Paris", 
    price: rand(1..1000), 
    title: Faker::Lorem.characters(10), 
    description: Faker::Lorem.characters(25), 
    duration: rand(1..10)*5, 
    start_date: Time.now + 1.day
    )
  print '.'
end
puts '=== Events DB created ==='

10.times do
  event = Event.all.sample
  Attendance.create!(
    event_id: Event.all.sample.id, 
    invited_id: User.all.sample.id
    )
  print '.'
end
puts '=== Attendances DB created ==='
