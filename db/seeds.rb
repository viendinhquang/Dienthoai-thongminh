# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
100.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.unique.free_email
  password = Faker::Internet.password(8, 10)
  sex = "male"
  birthday = Faker::Date.birthday
  avatar = Faker::Avatar.image
  User.create(name: name, email: email, password: password, sex: sex, birthday: birthday, avatar: avatar)
end
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
