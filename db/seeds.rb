# Users

3.times do |i|
  User.create!(
    name: "User#{i+1}",
    email: "user#{i+1}@test.com",
    password: "123123",
    password_confirmation: "123123"
  )
end

puts "Created 3 Users"


# Events

5.times do |i|
  Event.create!(
    user_id: 1,
    title: "test-event-#{i}",
    description: "test-description-1",
    address: "1717 Test Street, Auburn AL 3683#{i}",
    datetime: "2020-06-#{i+1} #{i+1}:00:00"
  )
end

puts "Created 5 events User1"

5.times do |i|
  Event.create!(
    user_id: 2,
    title: "test-event-#{i+6}",
    description: "test-description-2",
    address: "2323 Other Test Street, Auburn AL 3683#{i}",
    datetime: "2020-07-#{i+1} #{i}:00:00"
  )
end

puts "Created 5 events User2"

5.times do |i|
  Event.create!(
    user_id: 3,
    title: "test-event-#{i+11}",
    description: "test-description-3",
    address: "1717 My Stree6, Auburn AL 3683#{i}",
    datetime: "2020-08-#{i+1} #{i}:10:00"
  )
end

puts "Created 5 events User3"
