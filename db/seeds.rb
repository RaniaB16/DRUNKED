# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Friendship.destroy_all
Meeting.destroy_all
Drink.destroy_all
Party.destroy_all
User.destroy_all

user = User.create!(
  email: "test@gmail.com",
  password: "123456",
  first_name: "cesar",
  last_name: "castagne",
  sex: "men",
  weight: 95,
  age: 24
)

user1 = User.create!(
  email: "test1@gmail.com",
  password: "123456",
  first_name: "albin",
  last_name: "castagne",
  sex: "men",
  weight: 95,
  age: 24
)

user2 = User.create!(
  email: "test2@gmail.com",
  password: "123456",
  first_name: "sarah",
  last_name: "castagne",
  sex: "men",
  weight: 95,
  age: 24
)

Friendship.create!(user_one_id: user.id, user_two_id: user1.id)
Friendship.create!(user_one_id: user.id, user_two_id: user2.id)

party = Party.create!(
  name: "Party test",
  user: user
)

party1 = Party.create!(
  name: "Party test 1",
  user: user
)

party2 = Party.create!(
  name: "Wagolympiades",
  user: user
)

meeting = Meeting.create!(
  user: user,
  party: party,
  start_date: Date.today,
  end_date: Date.today + 1
)
