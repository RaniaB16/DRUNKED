# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Deleting all data..."

Friendship.destroy_all
Beverage.destroy_all
Meeting.destroy_all
Drink.destroy_all
Party.destroy_all
User.destroy_all

puts "Data destroy"

puts "Creating users..."

rania = User.create(
  email: "rania@gmail.com",
  password: "123456",
  first_name: "Rania",
  last_name: "Boutekrabet",
  sex: "woman",
  age: 25,
  weight: 65
)

file = URI.open('https://avatars.githubusercontent.com/u/89931921?v=4')
rania.photo.attach(io: file, filename: 'rania.png', content_type: 'image/png')

cesar = User.create(
  email: "cesar@gmail.com",
  password: "123456",
  first_name: "César",
  last_name: "Castagné",
  sex: "man",
  age: 22,
  weight: 70
)

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633375237/vbxacwsarxutnsxgjmjr.jpg')
cesar.photo.attach(io: file, filename: 'cesar.jpg', content_type: 'image/jpg')

albin = User.create!(
  email: "albin@gmail.com",
  password: "123456",
  first_name: "Albin",
  last_name: "Le Bon",
  sex: "man",
  age: 30,
  weight: 100
)

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633191373/e2hfxkphg4ncypgbyzq4.jpg')
albin.photo.attach(io: file, filename: 'albin.jpg', content_type: 'image/jpg')

sarah = User.create!(
  email: "sarah@gmail.com",
  password: "123456",
  first_name: "Sarah",
  last_name: "Levi",
  sex: "woman",
  age: 25,
  weight: 60
)

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633462939/fggdl1z7cg0vmt8n8nr2.jpg')
sarah.photo.attach(io: file, filename: 'sarah.jpg', content_type: 'image/jpg')

thomas = User.create(
  first_name: "Thomas",
  last_name: "Paulin",
  email: "thomas@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sex: "man",
  age: 23,
  weight: 55
)

file = URI.open('https://media.istockphoto.com/photos/headshot-of-44-year-old-mixed-race-man-in-casual-polo-shirt-picture-id1264106963?b=1&k=20&m=1264106963&s=170667a&w=0&h=dLQliHpFkaweGQhiRfkNGkwsAPoKCEy9UWWk-m2iCCk=')
thomas.photo.attach(io: file, filename: 'thomas.png', content_type: 'image/png')

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

file = URI.open('https://media.istockphoto.com/photos/portrait-young-confident-smart-asian-businessman-look-at-camera-and-picture-id1288538088?b=1&k=20&m=1288538088&s=170667a&w=0&h=3efMku7kSXUhpVrErAVVgxp6G91tRZ_5seygOn68RnE=')
benjamin.photo.attach(io: file, filename: 'benjamin.png', content_type: 'image/png')

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
file = URI.open('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60')
chloe.photo.attach(io: file, filename: 'chloe.png', content_type: 'image/png')

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
file = URI.open('https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60')
paul.photo.attach(io: file, filename: 'paul.png', content_type: 'image/png')


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

file = URI.open('https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60')
julia.photo.attach(io: file, filename: 'julia.png', content_type: 'image/png')

puts "Users created!"

puts "Creating friendships.."

Friendship.create!(user_one_id: albin.id, user_two_id: cesar.id)
Friendship.create!(user_one_id: albin.id, user_two_id: rania.id)
Friendship.create!(user_one_id: albin.id, user_two_id: sarah.id)
Friendship.create!(user_one_id: albin.id, user_two_id: paul.id)
Friendship.create!(user_one_id: albin.id, user_two_id: chloe.id)
Friendship.create!(user_one_id: albin.id, user_two_id: julia.id)

puts "Friendships done !"

puts "Creating parties..."

Party.create(name: "Hallowen's Party", user_id: thomas.id)
Party.create(name: "Noel's Party", user_id: julia.id)
Party.create(name: "Lea's birthday", user_id: benjamin.id)
patoche = Party.create(name: "Patrick's place", user_id: albin.id)
nana = Party.create(name: "Nana's dinner", user_id: albin.id)
party = Party.create(name: "Diane's party !", user_id: albin.id)

puts "Parties created"

puts "Creating meetings"

Meeting.create(user: albin, party: patoche)
Meeting.create(user: albin, party: nana)
Meeting.create(user: albin, party: party)

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
Drink.create!(alcool_type: "Whisky", alcool_degree: 0.40, quantity: 30)
Drink.create!(alcool_type: "Rum", alcool_degree: 0.40, quantity: 30)
Drink.create!(alcool_type: "Vodka", alcool_degree: 0.40, quantity: 30)
Drink.create!(alcool_type: "Pastis", alcool_degree: 0.45, quantity: 20)

# Champagne

Drink.create!(alcool_type: "Champagne", alcool_degree: 0.09, quantity: 125)

# Cocktails

Drink.create!(alcool_type: "Mojito", alcool_degree: 0.11, quantity: 230)
Drink.create!(alcool_type: "Sex on the Beach", alcool_degree: 0.15, quantity: 140)
Drink.create!(alcool_type: "Long Island", alcool_degree: 0.25, quantity: 120)
Drink.create!(alcool_type: "Caïpirinha", alcool_degree: 0.34, quantity: 70)
Drink.create!(alcool_type: "Margarita", alcool_degree: 0.31, quantity: 10)
Drink.create!(alcool_type: "Pina Colada", alcool_degree: 0.09, quantity: 180)
Drink.create!(alcool_type: "Gin Tonic", alcool_degree: 0.13, quantity: 120)
Drink.create!(alcool_type: "Bloody Mary", alcool_degree: 0.10, quantity: 80)
Drink.create!(alcool_type: "Cosmopolitan", alcool_degree: 0.20, quantity: 90)
Drink.create!(alcool_type: "Old Fashioned", alcool_degree: 0.40, quantity: 60)

puts "Drinks created!"
