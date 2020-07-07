# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'bcrypt'

include BCrypt

10.times do
    User.create(username: Faker::Internet.unique.username, password: Password.create(Faker::Internet.unique.password), email: Faker::Internet.unique.email)
end

25.times do 
    Item.create(category: ["Food", "Toy", "Care", "Accessories"].sample, name: (Faker::Commerce.unique.product_name + " for Dogs") , price: rand(50))
end

15.times do 
    Order.create(user_id: User.all.ids.sample, item_id: Item.all.ids.sample)
end