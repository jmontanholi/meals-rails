# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
  name: 'joao',
  email: 'joao@gmail.com',
  password: '123456',
  password_confirmation: '123456',
)
# user.skip_confirmation!
user.save!

user = User.new(
  name: 'gab',
  email: 'gabriel@gmail.com',
  password: '123456',
  password_confirmation: '123456',
)
# user.skip_confirmation!
user.save!

(1..10).each do |id|
  Food.create!(
      id: id,
      user_id: rand(1..2),
      name: Faker::Book.title,
      price: rand(1..50),
      measurement_unit: ['kilograms', 'grams', 'liters', 'unit'].sample,
  )
end

(1..10).each do |id|
  Recipe.create!(
      id: id,
      name: Faker::Book.title,
      preparation_time: rand(1..10),
      cooking_time: rand(1..10),
      description: Faker::Lorem.paragraph,
      public: [true, false].sample,
      user_id: rand(1..2),
  )
end

(1..100).each do |id|
  RecipeFood.create!(
      id: id,
      food_id: rand(1..10),
      recipe_id: rand(1..10),
      quantity: rand(1..10),
  )
end

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end