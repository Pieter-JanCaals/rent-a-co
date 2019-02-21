
# First delete all existing entries in the database and start with a clean slate

Booking.destroy_all
Animal.destroy_all
User.destroy_all

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

puts "Generating user..."
@main_user = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "fred@mailinator.com",
  password: "lewagon",
  owner: true
)
puts "Done!"

puts "Generating animals..."
def create_animal(
    name: Faker::FunnyName.name,
    species: ANIMAL_SPECIES[rand(0...ANIMAL_SPECIES.size)],
    description: Faker::Hipster.paragraph,
    user: @main_user,
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
animal_f = create_animal(species: "Bear", description: "Gentle, great with children. Will sing and cook breakfast on demand.", remote_photo_url: "public/bear.jpg")

puts "Done!"

puts "Generating bookings..."
Booking.create!(
  user: @main_user,
  animal: animal_b,
  start_date: DateTime.now,
  end_date: DateTime.now + (rand * 10).floor,
  content: "This panthera tigris will be perfect for my movie. I NEED IT"
  )
puts "Done!"

puts "All done!"
