puts "Seeding data...."

User.create(name: "User1", email: "user1@example.com", password: "password1")
User.create(name: "User2", email: "user2@example.com", password: "password2")

# Create 20 blogs, with each blog belonging to a random user
10.times do
  user = User.order("RANDOM()").first
  Blog.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    body: Faker::Lorem.paragraph(sentence_count: 5),
    user_id: user.id
  )
end

puts "Done seeding data!"