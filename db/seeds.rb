# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting all data..."

Meeting.destroy_all
Drink.destroy_all
Party.destroy_all
User.destroy_all

puts "Data destroy"

puts "Creating users..."

user = User.create(
  email: "test@gmail.com",
  password: "123456",
  first_name: "cesar",
  last_name: "castagne",
  sex: "men",
  weight: 95,
  age: 24
)

elsa = User.create(
  first_name: "Elsa",
  last_name: "Paulin",
  email: "elsa@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sex: "woman",
  age: 23,
  weight: 55
)
benjamin = User.create(
  first_name: "Benjamin",
  last_name: "Crudo",
  email: "benjamin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sex: "man",
  age: 35,
  weight: 80
)

chloe = User.create(
  first_name: "Chloe",
  last_name: "Diavola",
  email: "chloe@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sex: "woman",
  age: 26,
  weight: 70
)

paul = User.create(
  first_name: "Paul",
  last_name: "Baudu",
  email: "paul@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sex: "man",
  age: 29,
  weight: 95
)

julia = User.create(
  first_name: "Julia",
  last_name: "Gaspard",
  email: "julia@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sex: "woman",
  age: 30,
  weight: 49
)

puts "Users created!"

puts "Creating parties..."

Party.create(name: "Hallowen's Party", user_id: elsa.id)
Party.create(name: "Noel's Party", user_id: julia.id)
Party.create(name: "Lea's birthday", user_id: benjamin.id)

puts "Parties created"

puts "Creating drinks..."

Drink.create!(alcool_type: "wine", alcool_degree: 0.10, quantity: 125)
Drink.create!(alcool_type: "beer", alcool_degree: 0.05, quantity: 250)
Drink.create!(alcool_type: "spirits", alcool_degree: 0.40, quantity: 40)
Drink.create!(alcool_type: "champagne", alcool_degree: 0.10, quantity: 12)
Drink.create!(alcool_type: "whiskey", alcool_degree: 0.40, quantity: 30)
Drink.create(alcool_type: "pastis", alcool_degree: 0.45, quantity: 30)

puts "Drinks created!"
