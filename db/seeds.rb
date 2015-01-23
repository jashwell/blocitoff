require 'faker'

# Create Users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Lists
10.times do
  List.create!(
    user: users.sample,
    title: Faker::Lorem.sentence
  )
end
lists = List.all

# Create Items
15.times do
  Item.create!(
    list: lists.sample,
    body: Faker::Lorem.sentence(3, true, 2)
  )

  item.update_attributes!(created_at: rand(1.minutes .. 7.days).ago)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"