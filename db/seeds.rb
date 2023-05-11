puts "Seeding data...."

User.create(name: "User1", email: "user1@example.com", password: "password1")
User.create(name: "User2", email: "user2@example.com", password: "password2")

puts "Done seeding data!"