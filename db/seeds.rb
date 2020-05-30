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
    title: "Event#{i+1}",
    description: "test-description-#{i+1}",
    address: "1717 Test Street, Auburn AL 3683#{i+1}",
    datetime: "2020-06-#{i+1} #{i+1}:00:00"
  )
end

puts "Created 5 events User1"

5.times do |i|
  Event.create!(
    user_id: 2,
    title: "Event#{i+6}",
    description: "test-description-#{i+6}",
    address: "2323 Other Test Street, Auburn AL 3683#{i+6}",
    datetime: "2020-07-#{i+6} #{i}:00:00"
  )
end

puts "Created 5 events User2"

5.times do |i|
  Event.create!(
    user_id: 3,
    title: "Event#{i+11}",
    description: "test-description-#{i+11}",
    address: "1717 My Stree6, Auburn AL 3683#{i+11}",
    datetime: "2020-08-#{i+11} #{i}:10:00"
  )
end

puts "Created 5 events User3"
