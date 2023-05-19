puts "Seeding data...."

User.create(name: "User1", email: "user1@example.com", password: "password1")
User.create(name: "User2", email: "user2@example.com", password: "password2")

# Create 10 blogs, with each blog belonging to a random user
10.times do
  user = User.order("RANDOM()").first
  Blog.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    body: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: user.id
  )
end

# Create 20 comments, with each comment belonging to a random user and a random blog
20.times do
  user = User.order("RANDOM()").first
  blog = Blog.order("RANDOM()").first
  Comment.create!(
    body: Faker::Lorem.paragraph(sentence_count: 1),
    user_id: user.id,
    blog_id: blog.id
  )
end

puts "Done seeding data!"