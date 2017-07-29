# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = '12345'
Answer.destroy
Users_question.destroy
Badge.destroy
Question.destroy
DrillGroup.destroy
User.destroy

#setting at least one admin
User.create first_name: 'Allain', last_name: 'Era', username: 'aera', email: 'aera@quiz.edu', password: PASSWORD, is_admin: true

#setting non-admin users
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user_name = (first_name[0] + last_name).downcase
  User.create(
    first_name: first_name,
    last_name: last_name,
    username: username,
    email: "#{first_name.downcase}-#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

#setting to a var for convenience
users = User.all

#setting Drill Group (finalized, sort of)
DrillGroup.create category:'HTML', difficulty:'easy', 
