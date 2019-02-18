
# First delete all existing entries in the database and start with a clean slate
Booking.destroy_all
Animal.destroy_all
User.destroy_all

# Some hard coded animal species where we will chose one from each time an animal
# is created
ANIMAL_SPECIES = ["Bear", "Monkey", "Dolphin", "Zebra", "Elephant", "Lion", "Snake"]


# Create 15 random users
15.times do
  # The new created user has a 40% chance to be an owner. All the others will
  # just be normal clients
  owner = rand > 0.6

  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "TeamAwesome!!!",
    owner: owner
  )
end

# Create 25 random animals
25.times do
  users = User.where(owner: true)
  Animal.create!(
    name: Faker::FunnyName.name,
    species: ANIMAL_SPECIES[rand(0...ANIMAL_SPECIES.size)],
    description: Faker::Hipster.paragraph,
    user: users[rand(0...users.size)],
    price: Faker::Number.decimal(2),
    photo: "http://loremflickr.com/200/300/animals"
  )
end

# Create 10 random bookings betweens existing users and animals
10.times do
  users = User.where(owner: true)
  animals = Animal.all
  Booking.create!(
    user: users[rand(0...users.size)],
    animal: animals[rand(0...ANIMAL_TYPES.size)],
    start_date: DateTime.now,
    end_date: DateTime.now + (rand * 10).floor,
    content: Faker::Hipster.paragraph
  )
end

