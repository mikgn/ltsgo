# Users

5.times do |i|
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


# Comments

event = Event.find(1)

3.times do
  event.comments.create!(
    body: "Lorem Ipsum has been the industry'sstandard dummy text ever since the 1500s,
           when an unknown printer took a galley of type and scrambled it to make a type
           specimen book. It has survived not only five centuries.",
    user_id: 1
  )
end

3.times do
  event.comments.create!(
    body: "Lorem Ipsum has been the industry'sstandard dummy text ever since the 1500s,
           when an unknown printer took a galley of type and scrambled it to make a type
           specimen book. It has survived not only five centuries.",
    user_id: 2
  )
end

puts "Created 6 comments on Event(1), 3 of user_id:1 and 3 of user_id: 2"

#Subscriptions


Subscription.create!(
  user_id: 2,
  event_id: 1
)


puts "Created a Subscriber user_id: 2, on Event(1)"

2.times do |i|
  Subscription.create!(
    user_name: "Alex#{i+1}",
    user_email: "alex#{i+1}@test.com",
    event_id: 1
  )
end

puts "Created 2 no registered Subscribers"
