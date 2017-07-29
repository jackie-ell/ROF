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
User.create first_name:'Allain', last_name:'Era', username:'aera', email:'aera@quiz.edu', password:PASSWORD, is_admin:true
User.create first_name:'Jackie', last_name:'Ell', username:'jell', email:'jell@quiz.edu', password:PASSWORD, is_admin:true
User.create first_name:'Jacky', last_name:'Chui', username:'jchui', email:'jcui@quiz.edu', password:PASSWORD, is_admin:true

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

#setting Drill Group (plausible categories)
DrillGroup.create category:'HTML tags', difficulty:'easy', description:'Basic DOM elements'
DrillGroup.create category:'HTML structure', difficulty:'normal', description:'The DOM tree'
DrillGroup.create category:'HTML advanced', difficulty:'hard', description:'The canvas element'

DrillGroup.create category:'CSS basics', difficulty:'easy', description:'Styling fonts'
DrillGroup.create category:'CSS positioning', difficulty:'normal', description:'Absolute and Relative'
DrillGroup.create category:'CSS advanced', difficulty:'hard', description:'Pseudo-selectors'

DrillGroup.create category:'JavaScript intro', difficulty:'easy', description:'Basic types and control flow'
DrillGroup.create category:'Javascript arrays and loops', difficulty:'normal', description:'The DOM tree'
DrillGroup.create category:'Javascript asynchronicity', difficulty:'hard', description:'Promises'

DrillGroup.create category:'jQuery basics', difficulty:'easy', description:'Selectors'
DrillGroup.create category:'jQuery events 1', difficulty:'normal', description:'Mouse events'
DrillGroup.create category:'jQuery advanced', difficulty:'hard', description:'DOM manipulation'

DrillGroup.create category:'Ruby basics', difficulty:'easy', description:'Data types'
DrillGroup.create category:'Ruby collections', difficulty:'normal', description:'Iterations'
DrillGroup.create category:'Ruby OOP 1', difficulty:'hard', description:'Classes and Models'

DrillGroup.create category:'RoR basics', difficulty:'easy', description:'MVC overview'
DrillGroup.create category:'RoR ORM', difficulty:'normal', description:'ActiveRecord CRUD'
DrillGroup.create category:'RoR navigation 2', difficulty:'easy', description:'Nested Routing'

#setting questions (has to be replaced)
