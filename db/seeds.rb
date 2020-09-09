# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants...'
category = %w[chinese italian japanese french japanese belgian]

50.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    category: category.sample
  )
  3.times do
    Review.create!(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant_id: restaurant.id
    )
  end
end

puts 'Finished for the restaurants!'

puts 'Finished for the reviews!'
