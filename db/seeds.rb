# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = '12345'

Question.destroy_all
Answer.destroy_all
UsersQuestion.destroy_all
Badge.destroy_all
DrillGroup.destroy_all
User.destroy_all

#setting at least one admin
User.create first_name:'Allain', last_name:'Era', username:'aera', email:'aera@quiz.edu', password:PASSWORD, is_admin:true
User.create first_name:'Jackie', last_name:'Ell', username:'jell', email:'jell@quiz.edu', password:PASSWORD, is_admin:true
User.create first_name:'Jacky', last_name:'Chui', username:'jchui', email:'jcui@quiz.edu', password:PASSWORD, is_admin:true

#setting non-admin users
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = (first_name[0] + last_name).downcase
  User.create(
    first_name: first_name,
    last_name: last_name,
    username: username,
    email: "#{username}@example.com",
    password: PASSWORD,
    is_admin: false
  )
end

#setting to a var for convenience
users = User.all

#setting Drill Group (plausible categories, 18)
DrillGroup.create category:'HTML tags', difficulty:'easy', description:'Basic DOM elements', user_id: users[0].id
DrillGroup.create category:'HTML structure', difficulty:'normal', description:'The DOM tree', user_id: users[0].id
DrillGroup.create category:'HTML advanced', difficulty:'hard', description:'The canvas element', user_id: users[0].id

DrillGroup.create category:'CSS basics', difficulty:'easy', description:'Styling fonts', user_id: users[0].id
DrillGroup.create category:'CSS positioning', difficulty:'normal', description:'Absolute and Relative', user_id: users[0].id
DrillGroup.create category:'CSS advanced', difficulty:'hard', description:'Pseudo-selectors', user_id: users[0].id

DrillGroup.create category:'JavaScript intro', difficulty:'easy', description:'Basic types and control flow', user_id: users[0].id
DrillGroup.create category:'Javascript arrays and loops', difficulty:'normal', description:'The DOM tree', user_id: users[0].id
DrillGroup.create category:'Javascript asynchronicity', difficulty:'hard', description:'Promises', user_id: users[0].id

DrillGroup.create category:'jQuery basics', difficulty:'easy', description:'Selectors', user_id: users[0].id
DrillGroup.create category:'jQuery events 1', difficulty:'normal', description:'Mouse events', user_id: users[0].id
DrillGroup.create category:'jQuery advanced', difficulty:'hard', description:'DOM manipulation', user_id: users[0].id

DrillGroup.create category:'Ruby basics', difficulty:'easy', description:'Data types', user_id: users[0].id
DrillGroup.create category:'Ruby collections', difficulty:'normal', description:'Iterations', user_id: users[0].id
DrillGroup.create category:'Ruby OOP 1', difficulty:'hard', description:'Classes and Models', user_id: users[0].id

DrillGroup.create category:'RoR basics', difficulty:'easy', description:'MVC overview', user_id: users[0].id
DrillGroup.create category:'RoR ORM', difficulty:'normal', description:'ActiveRecord CRUD', user_id: users[0].id
DrillGroup.create category:'RoR navigation 2', difficulty:'hard', description:'Nested Routing', user_id: users[0].id

#setting to a var for convenience
drill_groups = DrillGroup.all
p DrillGroup
p drill_groups

def points_range(difficulty)  #method called below to give a range of points per difficulty level
  if difficulty == 'easy'
    return rand(10..25)
  elsif difficulty == 'normal'
    return rand(30..50)
  else
    return rand(60..100)
  end
end

#setting questions (has to be replaced)
drill_groups.each do |dg|
  puts dg.category
  rand(5..8).times do                #there are 5 to 8 questions per drill group
    debug_id = Question.last ? Question.last.id.to_s : "0"
    question = Question.create(
      title: Faker::Seinfeld.quote + debug_id,
      description: Faker::Hacker.say_something_smart + debug_id,
      user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation   #(users.sample).id
      drill_group_id: dg.id,
      points: points_range(dg.difficulty)
    )

  end
end

questions = Question.all

questions.each do |question|
  rand(1..3).times do              #there are 1 to 3 possible correct answers per question
    Answer.create(
      body: "this is the answer",  #this is so correct answer can be tested
      question_id: question.id,
      user_id: users[0].id                   #admin Allain created this answer, necessary to not break validation
    )
  end
end




#setting badges
Badge.create name:'N00b Hacker', threshhold:'points', t_value: 500, user_id: users[0].id
Badge.create name:'L33t H4cker', threshhold:'points', t_value: 1000, user_id: users[0].id
Badge.create name:'ub3r3L33t H4ck3r', threshhold:'points', t_value: 1600, user_id: users[0].id



p questions

300.times do
  UsersQuestion.create(
    user_id: (users.sample).id,
    question_id: (questions.sample).id,
    last_answer: "this is the answer",
    is_correct: true,
    num_attempts: rand(1..10)
  )
end

answers = Answer.all
puts "Created #{users.count} users"
puts "Created #{questions.count} questions"
puts "Created #{answers.count} answers"
puts "Created #{users.count} users"
puts "Created #{UsersQuestion.all.count} correct attempts"
puts "Created #{Badge.all.count} badges"   #embadged users must be calculated
