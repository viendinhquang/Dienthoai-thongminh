# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
100.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@asiantech.vn"
  password = "password"
  Product.create(name: name)
end
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
