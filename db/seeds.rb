require "open-uri"
require 'faker'

puts "Delete all tables"

Dog.destroy_all
puts "Dogs deleted"
Review.destroy_all
puts "Reviews deleted"
UserReward.destroy_all
puts "User Rewards deleted"
Reward.destroy_all
puts "Rewards deleted"
Ride.destroy_all
puts "Rides deleted"
Course.destroy_all
puts "Courses deleted"
User.destroy_all
puts "Users deleted"

puts "All tables deleted"

user1 = User.new(email: "flo@gmail.com", password: "azerty", firstname: "Florian", lastname: "GAGNAIRE", nickname: "Metalzoid")
file = URI.open("https://res.cloudinary.com/dwnn7g1dx/image/upload/v1717509387/development/8cm6kcwqnqs3nmwypro7tj31uwlr.jpg")
user1.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
user1.save!
puts "user : #{user1.firstname} done"
3.times do
  reward = Reward.new(price: 5, name: Faker::Name.name, promocode: Faker::Barcode.ean, link: Faker::Internet.url)
  reward.save!
  puts "Reward : #{reward.name} done !"
  dog = Dog.new(name: Faker::Creature::Dog.name, race: "border", age: Faker::Number.number(digits: 2), user: user1)
  dog_photo = URI.open("https://res.cloudinary.com/dwnn7g1dx/image/upload/v1717522898/development/yuna_yltisx.jpg")
  dog.photo.attach(io: dog_photo, filename: "yuna.jpg", content_type: "image/jpg")
  dog.save!
  puts "dog : #{dog.name} done !"
  course = Course.new(distance: rand(0..5), latitude: rand(0..5), longitude: rand(0..5), water: true, trashs: true, poopbag: true, familyfriendly: true, difficulty: rand(0..5), timing: 30, name: Faker::Locations::Australia.location, description: Faker::Movies::HarryPotter.quote)
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  file2 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  file3 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  course.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
  course.photos.attach(io: file2, filename: "photo2.jpg", content_type: "image/jpg")
  course.photos.attach(io: file3, filename: "photo3.jpg", content_type: "image/jpg")
  course.save!
  puts "course : #{course.name} done !"
  UserReward.create!(user: user1, reward: reward)
  puts "user reward done !"
  Review.create!(rating: rand(0..5), comment: "c'est génial ! Merci beaucoup", user: user1, course: course)
  puts "review done !"
end

user2 = User.new(email: "audrey@gmail.com", password: "azerty", firstname: "Audrey", lastname: "audrey", nickname: "Audrey-ady")
file = URI.open("https://res.cloudinary.com/dwnn7g1dx/image/upload/v1717509387/development/8cm6kcwqnqs3nmwypro7tj31uwlr.jpg")
user2.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
user2.save!
puts "user : #{user2.firstname} done"
3.times do
  reward = Reward.new(price: 5, name: Faker::Name.name, promocode: Faker::Barcode.ean, link: Faker::Internet.url)
  reward.save!
  puts "Reward : #{reward.name} done !"
  dog = Dog.new(name: Faker::Creature::Dog.name, race: "border", age: Faker::Number.number(digits: 2), user: user2)
  dog_photo = URI.open("https://res.cloudinary.com/dwnn7g1dx/image/upload/v1717522898/development/yuna_yltisx.jpg")
  dog.photo.attach(io: dog_photo, filename: "yuna.jpg", content_type: "image/jpg")
  dog.save!
  puts "dog : #{dog.name} done !"
  course = Course.new(distance: rand(0..5), latitude: rand(0..5), longitude: rand(0..5), water: true, trashs: true, poopbag: true, familyfriendly: true, difficulty: rand(0..5), timing: 30, name: Faker::Locations::Australia.location, description: Faker::Movies::HarryPotter.quote)
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  file2 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  file3 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  course.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
  course.photos.attach(io: file2, filename: "photo2.jpg", content_type: "image/jpg")
  course.photos.attach(io: file3, filename: "photo3.jpg", content_type: "image/jpg")
  course.save!
  puts "course : #{course.name} done !"
  UserReward.create!(user: user2, reward: reward)
  puts "user reward done !"
  Review.create!(rating: rand(0..5), comment: "c'est génial ! Merci beaucoup", user: user2, course: course)
  puts "review done !"
end

user3 = User.new(email: "jennifer@gmail.com", password: "azerty", firstname: "Jennifer", lastname: "jen", nickname: "CrewmateOnly")
file = URI.open("https://res.cloudinary.com/dwnn7g1dx/image/upload/v1717509387/development/8cm6kcwqnqs3nmwypro7tj31uwlr.jpg")
user3.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
user3.save!
puts "user : #{user3.firstname} done"
3.times do
  reward = Reward.new(price: 5, name: Faker::Name.name, promocode: Faker::Barcode.ean, link: Faker::Internet.url)
  reward.save!
  puts "Reward : #{reward.name} done !"
  dog = Dog.new(name: Faker::Creature::Dog.name, race: "border", age: Faker::Number.number(digits: 2), user: user3)
  dog_photo = URI.open("https://res.cloudinary.com/dwnn7g1dx/image/upload/v1717522898/development/yuna_yltisx.jpg")
  dog.photo.attach(io: dog_photo, filename: "yuna.jpg", content_type: "image/jpg")
  dog.save!
  puts "dog : #{dog.name} done !"
  course = Course.new(distance: rand(0..5), latitude: rand(0..5), longitude: rand(0..5), water: true, trashs: true, poopbag: true, familyfriendly: true, difficulty: rand(0..5), timing: 30, name: Faker::Locations::Australia.location, description: Faker::Movies::HarryPotter.quote)
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  file2 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  file3 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  course.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
  course.photos.attach(io: file2, filename: "photo2.jpg", content_type: "image/jpg")
  course.photos.attach(io: file3, filename: "photo3.jpg", content_type: "image/jpg")
  course.save!
  puts "course : #{course.name} done !"
  UserReward.create!(user: user3, reward: reward)
  puts "user reward done !"
  Review.create!(rating: rand(0..5), comment: "c'est génial ! Merci beaucoup", user: user3, course: course)
  puts "review done !"
end

user4 = User.new(email: "nicolas@gmail.com", password: "azerty", firstname: "Nicolas", lastname: "thvt", nickname: "Nicothvtdb")
file = URI.open("https://res.cloudinary.com/dwnn7g1dx/image/upload/v1717509387/development/8cm6kcwqnqs3nmwypro7tj31uwlr.jpg")
user4.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
user4.save!
puts "user : #{user4.firstname} done"
3.times do
  reward = Reward.new(price: 5, name: Faker::Name.name, promocode: Faker::Barcode.ean, link: Faker::Internet.url)
  reward.save!
  puts "Reward : #{reward.name} done !"
  dog = Dog.new(name: Faker::Creature::Dog.name, race: "border", age: Faker::Number.number(digits: 2), user: user4)
  dog_photo = URI.open("https://res.cloudinary.com/dwnn7g1dx/image/upload/v1717522898/development/yuna_yltisx.jpg")
  dog.photo.attach(io: dog_photo, filename: "yuna.jpg", content_type: "image/jpg")
  dog.save!
  puts "dog : #{dog.name} done !"
  course = Course.new(distance: rand(0..5), latitude: rand(0..5), longitude: rand(0..5), water: true, trashs: true, poopbag: true, familyfriendly: true, difficulty: rand(0..5), timing: 30, name: Faker::Locations::Australia.location, description: Faker::Movies::HarryPotter.quote)
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  file2 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  file3 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/For%C3%AAt_am%C3%A9rique_du_sud.jpg/640px-For%C3%AAt_am%C3%A9rique_du_sud.jpg")
  course.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
  course.photos.attach(io: file2, filename: "photo2.jpg", content_type: "image/jpg")
  course.photos.attach(io: file3, filename: "photo3.jpg", content_type: "image/jpg")
  course.save!
  puts "course : #{course.name} done !"
  UserReward.create!(user: user4, reward: reward)
  puts "user reward done !"
  Review.create!(rating: rand(0..5), comment: "c'est génial ! Merci beaucoup", user: user4, course: course)
  puts "review done !"
end

puts "all done !!!"
