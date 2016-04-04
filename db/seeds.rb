
5.times do
  User.create!(
  name: Faker::Internet.user_name,
  email: Faker::Internet.safe_email,
  password: Faker::Internet.password(10, 20, true)
  )
end
users = User.all

15.times do
  List.create!(
    user: users.sample,
    name: Faker::Hacker.noun
  )
end

lists = List.all

50.times do
  Item.create!(
    list: lists.sample,
    name: Faker::Hacker.ingverb
  )
end

User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld'
)

User.create!(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} topics created"
puts "#{Item.count} comments created"
