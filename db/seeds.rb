
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# Seed Users
10.times do
  User.create(
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    email: Faker::Internet.email,
    password:"nonono"
  )
end



# Seed Cars
# Seed Cars with valid user_id values
10.times do
  Car.create(
    name: Faker::Vehicle.make_and_model,
    colour: Faker::Vehicle.color,
    registration_number: Faker::Vehicle.license_plate,
    location: Faker::Address.city,
    price_per_day: Faker::Number.between(from: 50, to: 200),
    image_url: Faker::LoremFlickr.image(size: "300x200", search_terms: ['car'])
  )
end


puts "Cars seeded successfully!"
