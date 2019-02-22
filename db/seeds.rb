
# First delete all existing entries in the database and start with a clean slate
print "Cleaning database..."

Booking.destroy_all
Animal.destroy_all
User.destroy_all
Review.destroy_all

puts "Done!"

# Some hard coded animal species where we will chose one from each time an animal
# is created

# ANIMAL_SPECIES = ["Bear", "Monkey", "Dolphin", "Zebra", "Elephant", "Lion", "Snake"]


# # Create 15 random users

# 15.times do

#   # The new created user has a 40% chance to be an owner. All the others will
#   # just be normal clients

#   owner = rand > 0.6

#   User.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "TeamAwesome!!!",
#     owner: owner
#   )
# end

# # Create 25 random animals

# 25.times do
#   users = User.where(owner: true)
#   Animal.create!(
#     name: Faker::FunnyName.name,
#     species: ANIMAL_SPECIES[rand(0...ANIMAL_SPECIES.size)],
#     description: Faker::Hipster.paragraph,
#     user: users[rand(0...users.size)],
#     price: Faker::Number.decimal(2),
#     remote_photo_url: "http://loremflickr.com/360/300/animals"
#   )
# end

# # Create 10 random bookings betweens existing users and animals

# 10.times do
#   users = User.where(owner: true)
#   animals = Animal.all
#   Booking.create!(
#     user: users[rand(0...users.size)],
#     animal: animals[rand(0...animals.size)],
#     start_date: DateTime.now,
#     end_date: DateTime.now + (rand * 10).floor,
#     content: Faker::Hipster.paragraph
#   )
# end

# These are the seeds to be used for the pitch. They can be discarted once it's done.

print "Generating user..."

def create_user(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  username: Faker::Space.star_cluster,
  email: Faker::Internet.free_email,
  password: "lewagon",
  owner: false,
  remote_photo_url: "http://loremflickr.com/360/300/random"
  )
  User.create!(
  first_name: first_name,
  last_name: last_name,
  username: username,
  email: email,
  password: password,
  owner: owner,
  remote_photo_url: remote_photo_url
  )
end

@owner = create_user(
  email: "owner@gmail.com",
  username: "AnimalTrainer210",
  owner: true
)

@not_owner = create_user(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "notowner@gmail.com",
  owner: false,
  remote_photo_url: "public/mrfox.jpg",
  username: "NextSpielberg"
)

@chester = create_user(
  username: "Chester J. Lampwick",
  email: "chester@gmail.com",
  remote_photo_url: "public/chester.jpg"
  )

@poster_1 = create_user
@poster_2 = create_user
@poster_3 = create_user
@poster_4 = create_user

puts "Done!"

print "Generating animals..."
def create_animal(
    name: Faker::FunnyName.name,
    species: "Animal",
    description: Faker::Hipster.paragraph,
    user: @owner,
    price: Faker::Number.decimal(2),
    remote_photo_url: "http://loremflickr.com/360/300/animals"
  )
  Animal.create!(
  name: name,
  species: species,
  description: description,
  user: user,
  price: price,
  remote_photo_url: remote_photo_url
  )
end


animal_a = create_animal(name: "Uggie", species: "dog", price: 2000.00, remote_photo_url:"public/dog.jpg" )
animal_b = create_animal(species: "Tiger", remote_photo_url: "public/tiger.jpg")
animal_c = create_animal(species: "Komodo dragon", remote_photo_url: "public/komodo.jpg")
animal_d = create_animal(species: "Parrot", remote_photo_url: "public/parrot.jpg")
animal_e = create_animal(species: "Horse", remote_photo_url: "public/horse.jpg")

def create_random_animal
  animal_species = ["Bear", "Monkey", "Dolphin", "Zebra", "Elephant", "Lion", "Snake"]
  animal = animal_species[rand(0...animal_species.size)]
  Animal.create!(
    name: Faker::FunnyName.name,
    species: animal,
    description: Faker::Hipster.paragraph,
    user: @owner,
    price: Faker::Number.decimal(2),
    remote_photo_url: "http://loremflickr.com/360/300/#{animal}"
  )
end

20.times do
  create_random_animal
end

@gentle_ben = create_animal(name: "Gentle Ben", species: "Bear", description: "Gentle, great with children. Will sing and cook breakfast on demand.", remote_photo_url: "public/bear.jpg")

puts "Done!"
print "Generating bookings..."

Booking.create!(
  user: @chester,
  animal: animal_b,
  start_date: DateTime.now,
  end_date: DateTime.now + (rand * 10).floor,
  content: "This panthera tigris will be perfect for my movie. I NEED IT"
  )
puts "Done!"

print "Generating reviews..."

def create_review(
  user: @poster_1,
  animal: @gentle_ben,
  content: "He was the best!"
  )
Review.create!(
  user: user,
  animal: animal,
  content: content
  )
end

create_review(user: @poster_1, animal: @gentle_ben, content: "Very docile, very friendly. Our shoot was a blast! THANKS GENTLE BEAR!" )
create_review(user: @poster_2, animal: @gentle_ben, content: "Kudos to the trainer! Now I want to put bears in all of my movies. Also, very impressive cooking!" )
create_review(user: @poster_3, animal: @gentle_ben, content: "Stupid lion... 5 stars!" )
create_review(user: @poster_4, animal: @gentle_ben, content: "Gentle Ben is my new BFF <3" )
create_review(user: @chester, animal: @gentle_ben, content: "Those corn muffins were lousy!" )


puts "Done!"


puts "Finished!"



