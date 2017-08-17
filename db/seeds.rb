# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.create!(name:  "Quang Vien",
             email: "dinhquangvien@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             birthday: "1993-10-12",
             sex: "Male",
             admin: true)
User.create!(name:  "Vien Vip",
             email: "vienvip9x@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             birthday: "1993-07-12",
             sex: "Female",
             admin: true)
User.create!(name:  "Paul Vien",
             email: "vien@asiantech.vn",
             password:              "123456",
             password_confirmation: "123456",
             birthday: "1993-06-11",
             sex: "Female",
             admin: true)
5.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.unique.free_email
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
20.times do
  title = Faker::Name.title
  content = Faker::Lorem.sentence(1)
  users.each { |user| user.posts.create!(title: title, content: content) }
end

#Create Categories
[{ name: "Smart Phone", icon: "mobile" },
 { name: "Tablet",      icon: "tablet" },
 { name: "Accessories", icon: "headphones" },
 { name: "Service",     icon: "wrench" },
 { name: "Promotion",   icon: "sort-amount-desc" }].each do |category|
  Category.create!({ name: category[:name], icon: "fa fa-#{category[:icon]}"})
end

#Create Sub Categories
#Smart Phone
category = Category.find(1)
[ "iPhone 5", "iPhone 6", "SamSung J5", "HTC M8", "Oppo F1"].each do |sub_category|
  category.sub_categories.create!(name: sub_category)
end
#Tablet
category = Category.find(2)
[ "iPad 2", "iPad 3", "iPad Pro", "iPac Mini", "iPad Air"].each do |sub_category|
  category.sub_categories.create!(name: sub_category)
end
#Accessories
category = Category.find(3)
[ "Phone Battery", "Backup Charger", "Headphone", "Memory Card", "Sim 3G"].each do |sub_category|
  category.sub_categories.create!(name: sub_category)
end
# Service
category = Category.find(4)
[ "Repair iPhone/iPad", "Repair SamSung", "Repair HTC", "Repair Oppo", "Replace the iPhone case"].each do |sub_category|
  category.sub_categories.create!(name: sub_category)
end
# Promotion
category = Category.find(5)
[ "General Promotion", "SALE"].each do |sub_category|
  category.sub_categories.create!(name: sub_category)
end

100.times do |n|
  name  = Faker::Vehicle.manufacture
  price = Faker::Number.number(3)
  made_in = Faker::Address.country
  screen_size = Faker::Number.between(4, 8)
  sub_category_id = Faker::Number.between(1, 20)
  # producer_id = Faker::Number.between(1, 100)
  # operating_system_id = Faker::Number.between(1, 100)
  Product.create(name: name, price: price, made_in: made_in, screen_size: screen_size, sub_category_id: sub_category_id)
end
20.times do
  [ "Gold", "Silver", "Gray"].each do |type_color|
  product_id = Faker::Number.between(1, 20)
  TypeColor.create!(name: type_color, product_id: product_id)
  end
end

# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
