# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Meeting.destroy_all
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

party = Party.create!(
  name: "Party test",
  user: user
)

meeting = Meeting.create!(
  user: user,
  party: party,
  start_date: Date.today,
  end_date: Date.today + 1
)
