# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# CREATE 5 USERS
5.times do
  first_name = Faker::Name.first_name
  puts first_name
  last_name = Faker::Name.last_name
  puts last_name
  full_name = first_name + ' ' + last_name
  puts full_name
  user = User.create(name: full_name, email: "#{first_name}.#{last_name}@mail.com", password: 'test')
  puts user.save
  puts user
end

users = User.all

# CREATE 30 RANDOM QUESTIONS AND SAVE TO DB
30.times do
  title = Faker::Lorem.sentence(word_count: 3)
  body = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4)
  user = users.sample
  Question.create title: title, body: body, user: user
end

puts "seeded database with #{User.count} users and #{Question.count} questions"
