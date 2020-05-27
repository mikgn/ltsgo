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
    title: "test-event-1",
    description: "test-description-1",
    address: "test-address-1",
    datetime: "2020-05-#{i+1} #{i}:00:00"
  )
end

puts "Created 5 events User1"

5.times do |i|
  Event.create!(
    user_id: 2,
    title: "test-event-2",
    description: "test-description-2",
    address: "test-address-2",
    datetime: "2020-05-#{i+1} #{i}:00:00"
  )
end

puts "Created 5 events User2"

5.times do |i|
  Event.create!(
    user_id: 3,
    title: "test-event-3",
    description: "test-description-3",
    address: "test-address-3",
    datetime: "2020-05-#{i+1} #{i}:00:00"
  )
end

puts "Created 5 events User3"
