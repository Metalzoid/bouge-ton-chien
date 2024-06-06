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
  file = URI.open("https://www.photo-paysage.com/albums/userpics/10001/thumb_Les_rayons_du_soleil_a_travers_les_feuillages_dans_la_foret.JPG")
  file2 = URI.open("https://www.photo-paysage.com/albums/userpics/10001/thumb_Balade_en_foret_dans_les_ALpes.jpg")
  file3 = URI.open("https://www.photo-paysage.com/albums/automne/thumb_automne-chemin-foret-dourdan-01.jpg")
  course.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
  course.photos.attach(io: file2, filename: "photo2.jpg", content_type: "image/jpg")
  course.photos.attach(io: file3, filename: "photo3.jpg", content_type: "image/jpg")
  course.latitude = "44.84158730375328"
  course.longitude = "-0.5805419812544561"
  course.route = [[-0.5805419812544561, 44.84158730375328],
                  [-0.580695142470969, 44.84157329080194],
                  [-0.5808408926608765, 44.84153825840873],
                  [-0.580956998744362, 44.84143491272459],
                  [-0.5809668801131693, 44.84130704407919],
                  [-0.5809372360067475, 44.84123172405935],
                  [-0.580929824980142, 44.84116691373089],
                  [-0.5808952401893166, 44.84107057391872],
                  [-0.5808705367672983, 44.84096547575809],
                  [-0.5808631257406929, 44.84095146265552],
                  [-0.5808260706076656, 44.84083410278771],
                  [-0.5807420789614005, 44.84064492517464],
                  [-0.5807000831439695, 44.84058361748464],
                  [-0.5803987013953473, 44.84060989221691],
                  [-0.5801368451219542, 44.84063091199412],
                  [-0.5801047306733306, 44.8407885600786],
                  [-0.5801170823843397, 44.84095671755992],
                  [-0.5801244934109451, 44.84134032497736],
                  [-0.5801244934070356, 44.84145768382262],
                  [-0.5801096713538247, 44.84162058449817],
                  [-0.580339413178594, 44.84160657155495],
                  [-0.5805444515813453, 44.84158380051491]]
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
  file = URI.open("https://www.photo-paysage.com/albums/userpics/10001/thumb_Les_rayons_du_soleil_a_travers_les_feuillages_dans_la_foret.JPG")
  file2 = URI.open("https://www.photo-paysage.com/albums/userpics/10001/thumb_Balade_en_foret_dans_les_ALpes.jpg")
  file3 = URI.open("https://www.photo-paysage.com/albums/automne/thumb_automne-chemin-foret-dourdan-01.jpg")
  course.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
  course.photos.attach(io: file2, filename: "photo2.jpg", content_type: "image/jpg")
  course.photos.attach(io: file3, filename: "photo3.jpg", content_type: "image/jpg")
  course.latitude = "44.84158730375328"
  course.longitude = "-0.5805419812544561"
  course.route = [[-0.5805419812544561, 44.84158730375328],
                  [-0.580695142470969, 44.84157329080194],
                  [-0.5808408926608765, 44.84153825840873],
                  [-0.580956998744362, 44.84143491272459],
                  [-0.5809668801131693, 44.84130704407919],
                  [-0.5809372360067475, 44.84123172405935],
                  [-0.580929824980142, 44.84116691373089],
                  [-0.5808952401893166, 44.84107057391872],
                  [-0.5808705367672983, 44.84096547575809],
                  [-0.5808631257406929, 44.84095146265552],
                  [-0.5808260706076656, 44.84083410278771],
                  [-0.5807420789614005, 44.84064492517464],
                  [-0.5807000831439695, 44.84058361748464],
                  [-0.5803987013953473, 44.84060989221691],
                  [-0.5801368451219542, 44.84063091199412],
                  [-0.5801047306733306, 44.8407885600786],
                  [-0.5801170823843397, 44.84095671755992],
                  [-0.5801244934109451, 44.84134032497736],
                  [-0.5801244934070356, 44.84145768382262],
                  [-0.5801096713538247, 44.84162058449817],
                  [-0.580339413178594, 44.84160657155495],
                  [-0.5805444515813453, 44.84158380051491]]
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
  file = URI.open("https://www.photo-paysage.com/albums/userpics/10001/thumb_Les_rayons_du_soleil_a_travers_les_feuillages_dans_la_foret.JPG")
  file2 = URI.open("https://www.photo-paysage.com/albums/userpics/10001/thumb_Balade_en_foret_dans_les_ALpes.jpg")
  file3 = URI.open("https://www.photo-paysage.com/albums/automne/thumb_automne-chemin-foret-dourdan-01.jpg")
  course.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
  course.photos.attach(io: file2, filename: "photo2.jpg", content_type: "image/jpg")
  course.photos.attach(io: file3, filename: "photo3.jpg", content_type: "image/jpg")
  course.latitude = "44.84158730375328"
  course.longitude = "-0.5805419812544561"
  course.route = [[-0.5805419812544561, 44.84158730375328],
                  [-0.580695142470969, 44.84157329080194],
                  [-0.5808408926608765, 44.84153825840873],
                  [-0.580956998744362, 44.84143491272459],
                  [-0.5809668801131693, 44.84130704407919],
                  [-0.5809372360067475, 44.84123172405935],
                  [-0.580929824980142, 44.84116691373089],
                  [-0.5808952401893166, 44.84107057391872],
                  [-0.5808705367672983, 44.84096547575809],
                  [-0.5808631257406929, 44.84095146265552],
                  [-0.5808260706076656, 44.84083410278771],
                  [-0.5807420789614005, 44.84064492517464],
                  [-0.5807000831439695, 44.84058361748464],
                  [-0.5803987013953473, 44.84060989221691],
                  [-0.5801368451219542, 44.84063091199412],
                  [-0.5801047306733306, 44.8407885600786],
                  [-0.5801170823843397, 44.84095671755992],
                  [-0.5801244934109451, 44.84134032497736],
                  [-0.5801244934070356, 44.84145768382262],
                  [-0.5801096713538247, 44.84162058449817],
                  [-0.580339413178594, 44.84160657155495],
                  [-0.5805444515813453, 44.84158380051491]]
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
  file = URI.open("https://www.photo-paysage.com/albums/userpics/10001/thumb_Les_rayons_du_soleil_a_travers_les_feuillages_dans_la_foret.JPG")
  file2 = URI.open("https://www.photo-paysage.com/albums/userpics/10001/thumb_Balade_en_foret_dans_les_ALpes.jpg")
  file3 = URI.open("https://www.photo-paysage.com/albums/automne/thumb_automne-chemin-foret-dourdan-01.jpg")
  course.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
  course.photos.attach(io: file2, filename: "photo2.jpg", content_type: "image/jpg")
  course.photos.attach(io: file3, filename: "photo3.jpg", content_type: "image/jpg")
  course.latitude = "44.84158730375328"
  course.longitude = "-0.5805419812544561"
  course.route = [[-0.5805419812544561, 44.84158730375328],
                  [-0.580695142470969, 44.84157329080194],
                  [-0.5808408926608765, 44.84153825840873],
                  [-0.580956998744362, 44.84143491272459],
                  [-0.5809668801131693, 44.84130704407919],
                  [-0.5809372360067475, 44.84123172405935],
                  [-0.580929824980142, 44.84116691373089],
                  [-0.5808952401893166, 44.84107057391872],
                  [-0.5808705367672983, 44.84096547575809],
                  [-0.5808631257406929, 44.84095146265552],
                  [-0.5808260706076656, 44.84083410278771],
                  [-0.5807420789614005, 44.84064492517464],
                  [-0.5807000831439695, 44.84058361748464],
                  [-0.5803987013953473, 44.84060989221691],
                  [-0.5801368451219542, 44.84063091199412],
                  [-0.5801047306733306, 44.8407885600786],
                  [-0.5801170823843397, 44.84095671755992],
                  [-0.5801244934109451, 44.84134032497736],
                  [-0.5801244934070356, 44.84145768382262],
                  [-0.5801096713538247, 44.84162058449817],
                  [-0.580339413178594, 44.84160657155495],
                  [-0.5805444515813453, 44.84158380051491]]
  course.save!
  puts "course : #{course.name} done !"
  UserReward.create!(user: user4, reward: reward)
  puts "user reward done !"
  Review.create!(rating: rand(0..5), comment: "c'est génial ! Merci beaucoup", user: user4, course: course)
  puts "review done !"
end

puts "all done !!!"
