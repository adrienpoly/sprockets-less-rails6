# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Removing users'
User.destroy_all

puts 'Removing products'
Product.destroy_all

User.create!(first_name: 'Admin', last_name: 'Doe', admin: true, email: 'admin@gmail.com', password: '123456')
User.create!(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '123456')

20.times do |index|
  p Product.create!(
    name: Faker::Food.dish,
    description: Faker::Food.description,
    sku: SecureRandom.hex(8),
    price_cents: (Faker::Commerce.price * 100).to_i,
    image: "#{(index % 9 + 1)}.jpg"
  )
end
