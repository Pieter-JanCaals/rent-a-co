ANIMAL_TYPES = ["Bear", "Monkey", "Dolphin", "Zebra", "Elephant", "Lion", "Snake"]

15.times do
  owner = rand > 0.6
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    owner: owner
  )
end

25.times do
  users = User.where(owner: true)
  Animal.create!(
    name: Faker::FunnyName.name,
    type: ANIMAL_TYPES[rand(0...ANIMAL_TYPES.size)],
    description: Faker::Hipster.paragraph,
    user: users[rand(0...users.size)],
    price: Faker::Number.decimal(2),
    photo: "http://loremflickr.com/200/300/animals"
  )
end

10.times do
  users = User.where(owner: true)
  animals = Animal.all
  Booking.create!(
    user: users[rand(0...users.size)],
    animal: animals[rand(0...ANIMAL_TYPES.size)],
    start_date: DateTime.now,
    end_date: DateTime.now + (rand * 10).floor
  )
end

