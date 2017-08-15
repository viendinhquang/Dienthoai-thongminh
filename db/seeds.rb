# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.create!(name:  "Quang Vien",
             email: "dinhquangvien@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             sex: "Male",
             admin: true)
User.create!(name:  "Vien Vip",
             email: "vienvip9x@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             sex: "Female",
             admin: true)
User.create!(name:  "Paul Vien",
             email: "vien@asiantech.vn",
             password:              "123456",
             password_confirmation: "123456",
             sex: "Female",
             admin: true)
100.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.unique.free_email
  # password = Faker::Internet.password(6, 8)
  password = Devise.friendly_token.first(6)
  # password_confirmation = "password"
  sex = "Male"
  # sex = [ "Male", "Female"].each do |sex|
  #   User.create({sex: sex})
  # end
  birthday = Faker::Date.birthday
  avatar = Faker::Avatar.image
  User.create(name: name, email: email, password: password, password_confirmation: password, sex: sex, birthday: birthday, avatar: avatar, admin: false)
end

users = User.order(:created_at).take(5)
50.times do
  title = Faker::Name.title
  content = Faker::Lorem.sentence(1)
  users.each { |user| user.posts.create!(title: title, content: content) }
end

#Create Categories
[ "Smart Phone", "Tablet", "Accessories", "Service", "Promotion"].each do |category|
  Category.create!({name: category})
end

#Create Sub Categories
#Smart Phone
categories =Category.order(:created_at).where(id: 1)
5.times do
  [ "iPhone 5", "iPhone 6", "SamSung J5", "HTC M8", "Oppo F1"].each do |sub_category|
    categories.each { |category| category.sub_categories.create!(name: sub_category)}
  end
end
#Tablet
categories =Category.order(:created_at).where(id:2)
5.times do
  [ "iPad 2", "iPad 3", "iPad Pro", "iPac Mini", "iPad Air"].each do |sub_category|
    categories.each { |category| category.sub_categories.create!(name: sub_category)}
  end
end
#Accessories
categories =Category.order(:created_at).where(id:3)
5.times do
  [ "Phone Battery", "Backup Charger", "Headphone", "Memory Card", "Sim 3G"].each do |sub_category|
    categories.each { |category| category.sub_categories.create!(name: sub_category)}
  end
end
# Service
categories =Category.order(:created_at).where(id:4)
5.times do
  [ "Repair iPhone/iPad", "Repair SamSung", "Repair HTC", "Repair Oppo", "Replace the iPhone case"].each do |sub_category|
    categories.each { |category| category.sub_categories.create!(name: sub_category)}
  end
end
# Promotion
categories =Category.order(:created_at).where(id:5)
5.times do
  [ "General Promotion", "SALE"].each do |sub_category|
    categories.each { |category| category.sub_categories.create!(name: sub_category)}
  end
end

100.times do |n|
  name  = Faker::Vehicle.manufacture
  price = Faker::Number.number(5)
  made_in = Faker::Address.country
  screen_size = Faker::Number.between(4, 8)
  sub_category_id = Faker::Number.between(1, 100)
  # producer_id = Faker::Number.between(1, 100)
  # operating_system_id = Faker::Number.between(1, 100)
  Product.create(name: name, price: price, made_in: made_in, screen_size: screen_size, sub_category_id: sub_category_id)
end
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
