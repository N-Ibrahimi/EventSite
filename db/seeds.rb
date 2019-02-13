
User.destroy_all
Event.destroy_all
Attendance.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('events')
ActiveRecord::Base.connection.reset_pk_sequence!('attendances')


10.times do
  User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.unique.email, 
    password: Faker::Internet.password(8),
    description:Faker::Lorem.paragraph
    )
  print '.'
end
puts '=== Users DB created ==='

10.times do
  Event.create!(
    admin_id: User.all.sample.id, 
    location: Faker::Hobbit.location,
    price: rand(1..1000), 
    title: Faker::Lorem.sentence, 
    description:Faker::Lorem.paragraph, 
    duration: rand(1..10)*5, 
    start_date:Faker::Date.between(Date.today,1.year.from_now)
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
