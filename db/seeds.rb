# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
100.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.unique.free_email
  password = Faker::Internet.password(8, 10)
  sex = "Male"
  # sex = [ "Male", "Female"].each do |sex|
  #   User.create({sex: sex})
  # end
  birthday = Faker::Date.birthday
  avatar = Faker::Avatar.image
  User.create(name: name, email: email, password: password, sex: sex, birthday: birthday, avatar: avatar)
end

users = User.order(:created_at).take(5)
50.times do
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
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
