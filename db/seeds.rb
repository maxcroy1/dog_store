# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'bcrypt'

require 'date'

include BCrypt

10.times do
    User.create(username: Faker::Internet.unique.username, password_digest: Password.create(Faker::Internet.unique.password), email: Faker::Internet.unique.email)
end

25.times do 
    Item.create(category: ["Food", "Toy", "Care", "Accessories"].sample, name: (Faker::Commerce.unique.product_name + " for Dogs") , price: rand(50))
end

10.times do
    ShippingInfo.create({
        user_id: User.ids.sample,
        address_one: Faker::Address.unique.street_address,
        address_two: Faker::Address.unique.secondary_address,
        city: Faker::Address.unique.city,
        state: Faker::Address.unique.state,
        country: "USA",
        zip_code: Faker::Address.unique.zip_code
    })
end

def random_user
    user = User.all.sample
    return user unless user.shipping_infos.blank?
    random_user 
end

def random_user_with_billing
    user = User.all.sample
    return user unless user.billing_infos.blank?
    random_user_with_billing
end

def random_user_with_payment
    user = User.all.sample
    return user unless user.payment_infos.blank?
    random_user_with_payment
end

10.times do
    user = random_user
    BillingInfo.create({
        user_id: user.id,
        address_one: Faker::Address.unique.street_address,
        address_two: Faker::Address.unique.secondary_address,
        city: Faker::Address.unique.city,
        state: Faker::Address.unique.state,
        country: "USA",
        zip_code: Faker::Address.unique.zip_code
    })
end

10.times do
    user = random_user_with_billing 
    PaymentInfo.create({
        user_id: user.id,
        billing_info_id: user.billing_infos.first.id,
        name_on_card: user.username,
        card_number: Faker::Finance.credit_card.split("-").join.to_i,
        expiration: DateTime.new(2025,1),
        cvc: rand(999),
        zip_code: user.billing_infos.first.zip_code
    })
end



10.times do
    user = random_user_with_payment
    Order.create({
      user_id: user.id,
      shipping_info_id: user.shipping_infos.first.id,
      billing_info_id: user.billing_infos.first.id,
      payment_info_id: user.payment_infos.first.id,
      total: rand(500)
    })
end

