# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting all data..."

Friendship.destroy_all
Beverage.destroy_all
Meeting.destroy_all
Drink.destroy_all
Party.destroy_all
User.destroy_all

puts "Data destroy"

puts "Creating users..."

cesar = User.create(
  email: "cesar@gmail.com",
  password: "123456",
  first_name: "César",
  last_name: "Castagné",
  sex: "men",
  age: 22,
  weight: 70
)

user1 = User.create!(
  email: "albin@gmail.com",
  password: "123456",
  first_name: "Albin",
  last_name: "Le Bon",
  sex: "men",
  age: 29,
  weight: 80
)

user2 = User.create!(
  email: "sarah@gmail.com",
  password: "123456",
  first_name: "Sarah",
  last_name: "Levi",
  sex: "woman",
  age: 25,
  weight: 60
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

puts "Creating friendships.."

Friendship.create!(user_one_id: cesar.id, user_two_id: user1.id)
Friendship.create!(user_one_id: cesar.id, user_two_id: user2.id)

puts "Friendships done !"

puts "Creating parties..."

Party.create(name: "Hallowen's Party", user_id: elsa.id)
Party.create(name: "Noel's Party", user_id: julia.id)
Party.create(name: "Lea's birthday", user_id: benjamin.id)

puts "Parties created"

puts "Creating drinks..."

# Wines

Drink.create!(alcool_type: "Red Wine", alcool_degree: 0.12, quantity: 125)
Drink.create!(alcool_type: "White Wine", alcool_degree: 0.12, quantity: 125)
Drink.create!(alcool_type: "Rosé", alcool_degree: 0.12, quantity: 125)

# Beers

Drink.create!(alcool_type: "Brown Beer", alcool_degree: 0.09, quantity: 250)
Drink.create!(alcool_type: "White Beer", alcool_degree: 0.05, quantity: 250)
Drink.create!(alcool_type: "Blond Beer", alcool_degree: 0.05, quantity: 250)
Drink.create!(alcool_type: "Amber Beer", alcool_degree: 0.08, quantity: 250)
Drink.create!(alcool_type: "Brown Beer", alcool_degree: 0.09, quantity: 500)
Drink.create!(alcool_type: "White Beer", alcool_degree: 0.05, quantity: 500)
Drink.create!(alcool_type: "Blond Beer", alcool_degree: 0.05, quantity: 500)
Drink.create!(alcool_type: "Amber Beer", alcool_degree: 0.08, quantity: 500)

# Spirits

Drink.create!(alcool_type: "Gin", alcool_degree: 0.40, quantity: 30)
Drink.create!(alcool_type: "Whisky", alcool_degree: 0.45, quantity: 30)
Drink.create!(alcool_type: "Rum", alcool_degree: 0.40, quantity: 30)
Drink.create!(alcool_type: "Vodka", alcool_degree: 0.40, quantity: 30)
Drink.create!(alcool_type: "Pastis", alcool_degree: 0.45, quantity: 30)

# Champagne

Drink.create!(alcool_type: "Champagne", alcool_degree: 0.09, quantity: 125)

puts "Drinks created!"
