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
User.create first_name:'Allain', last_name:'Era', username:'aera', email:'aera@quiz.edu', password:PASSWORD, is_admin:true, total_pts: rand(1..1000)
User.create first_name:'Jackie', last_name:'Ell', username:'jell', email:'jell@quiz.edu', password:PASSWORD, is_admin:true, total_pts: rand(1..1000)
User.create first_name:'Jacky', last_name:'Chui', username:'jchui', email:'jcui@quiz.edu', password:PASSWORD, is_admin:true, total_pts: rand(1..1000)
User.create first_name:'Colin', last_name:'Hire', username:'chire', email:'colin@hire.ca', password: "hello", is_admin:true, total_pts: rand(1..1000)

#setting non-admin users
rand(40..150).times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = (first_name[0] + last_name).downcase
  points = rand(1..1000)
  User.create(
    first_name: first_name,
    last_name: last_name,
    username: username,
    email: "#{username}@example.com",
    password: PASSWORD,
    is_admin: false,
    total_pts: points
  )
end

#setting to a var for convenience
users = User.all

#setting Drill Group (plausible categories, 18)
dg = DrillGroup.create category:'HTML tags', difficulty:'easy', description:'Basic DOM elements', user_id: users[0].id
  Question.create(
    title: "Knowing Basic Tags 1",
    description: "What tag defines the main content of the HTML document or the section of the HTML document that will be directly visible on your web page?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 10
  )
  Question.create(
    title: "Knowing Basic Tags 2",
    description: "What block-level element represents blocks of text separated from adjacent blocks by vertical blank space and/or first-line indentation?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 11
  )
  Question.create(
    title: "Knowing Basic Tags 3",
    description: "What attribute of the anchor tag defines the link?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 16
  )
  Question.create(
    title: "Knowing Basic Tags 4",
    description: "Write a complete img tag for a source 'image.jpg' in an 'images' folder inside the root folder",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 20
  )

dg = DrillGroup.create category:'HTML structure', difficulty:'normal', description:'The DOM tree', user_id: users[0].id
  Question.create(
    title: "DOM Basics 1",
    description: "What data type represents the HTML elements in the DOM?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 30
  )
  Question.create(
    title: "DOM Basics 2",
    description: "What kind of array-like object represents the collection of DOM elements gathered by code?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 35
  )
  Question.create(
    title: "DOM Basics 3",
    description: "Give a method from the answer to the previous question acts as an iterator.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 40
  )
  Question.create(
    title: "Sample DOM code",
    description: "Write a line of Javascript that returns the absolute base URI of the document",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 45
  )

dg = DrillGroup.create category:'HTML advanced', difficulty:'hard', description:'The canvas element', user_id: users[0].id
  Question.create(
    title: "Basic Canvas Method 1",
    description: "What method (with parameter) defines the context of a render as two-dimensional?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 60
  )
  Question.create(
    title: "Basic Canvas Method 2",
    description: "What method reverts the canvas to a previously saved state?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 61
  )
  Question.create(
    title: "Canvas Text manipulation",
    description: "Write a piece of canvas code that flips 'Hello World' upside-down and strokes it blue by 2 pixels.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 75
  )
  Question.create(
    title: "Canvas Drawing",
    description: "Write a piece of canvas code that draws a golden spiral from the center of a 300 pixel-sided square canvas.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 85
  )

dg = DrillGroup.create category:'CSS basics', difficulty:'easy', description:'Styling fonts', user_id: users[0].id
  Question.create(
    title: "CSS priority",
    description: "Reorder this list in decreasing order of priority for CSS rendering: 'inpage, inline, infile'",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 10
  )
  Question.create(
    title: "Basic CSS 1",
    description: "Write a piece of CSS code that sets all h2 headers to red with bolded serif font",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 10
  )
  Question.create(
    title: "Basic CSS 2",
    description: "Write a piece of CSS code that sets the color of all div elements with class 'contents' red inside a div element of class 'container'.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 12
  )
  Question.create(
    title: "Basic CSS 3",
    description: "Write a piece of code that sets all h2 headers to red with bolded serif font",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 15
  )

dg = DrillGroup.create category:'CSS layouts', difficulty:'normal', description:'Displays and Positioning', user_id: users[0].id
  Question.create(
    title: "Inline and Block",
    description: "Can a <span> element set to display as block contain another <span> element set to display as block?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 30
  )
  Question.create(
    title: "Float",
    description: "What property determines how far 'up' a given element will float?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 35
  )
  Question.create(
    title: "Overflow",
    description: "What value clips the display of one element that overflows its container?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 40
  )
  Question.create(
    title: "Grid",
    description: "Write a piece of code that defines a 20x20 grid partitioning all of the viewport with all gutters colored blue",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 50
  )

dg = DrillGroup.create category:'CSS advanced', difficulty:'hard', description:'Transforms, Translations, and Animations', user_id: users[0].id
  Question.create(
    title: "Simple transform 1",
    description: "Write CSS that moves an element with class 'move-southeast' 50 pixels to the right, and 100 pixels down from its current position.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 60
  )
  Question.create(
    title: "Simple transform 2",
    description: "Write CSS that rotates an element with class 'spinner' 180 degrees counter-clockwise",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 65
  )
  Question.create(
    title: "Animation properties 1",
    description: "What is the default value of animation-duration?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 65
  )
  Question.create(
    title: "Animation properties 2",
    description: "In order to make the animation continue for ever, what property:value pair needs to be set?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 75
  )

dg = DrillGroup.create category:'JavaScript intro', difficulty:'easy', description:'Basic operators, types, and control flow', user_id: users[0].id
  Question.create(
    title: "On switch-case",
    description: "What keyword is used to get out of a switch-case block immediately?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 10
  )
  Question.create(
    title: "On types",
    description: "What method is used to determine a variable's data type?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 10
  )
  Question.create(
    title: "The ternary operation",
    description: "Write 'if x is true, return 100, otherwise return 0' as a ternary operation.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 22
  )
  Question.create(
    title: "Integer limit",
    description: "What is the highest EXACT possible value of an 'integer' in JavaScript?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 25
  )

dg = DrillGroup.create category:'Javascript Iterations', difficulty:'normal', description:'Collections and loops', user_id: users[0].id
  Question.create(
    title: "While loop",
    description: "Write a while loop that returns the factorial for an integer x.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 35
  )
  Question.create(
    title: "For loop",
    description: "Write a for loop for the array ['apple', 'banana', 'orange'] that returns the sum of the number of all their letters.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 35
  )
  Question.create(
    title: "Iterative Fibonacci",
    description: "Write iterative code that returns the first ten Fibonacci numbers",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 42
  )
  Question.create(
    title: "Recursive Fibonacci",
    description: "Write recursive code that returns the first ten Fibonacci numbers",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 50
  )

dg = DrillGroup.create category:'Javascript Higher Order Functions', difficulty:'hard', description:'HoFs and Timeouts', user_id: users[0].id
  Question.create(
    title: "After",
    description: "Given... const add = function (a, b) { return a + b}; ... write a function const addAfter3Tries = after(3, add) ... that should only return results on the fourth try thereon.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 60
  )
  Question.create(
    title: "Implement Filter",
    description: "Write an higher-order function, Filter, from scratch that takes two arguments: the first is an array, the second is a callback that will be called once for every element in the array with 3 arguments: the current value of an element, the current index of an element, and the array itself. Filter returns a new array that only contains elements of provided array where the callback function returns true.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 70
  )
  Question.create(
    title: "Implement Reduce",
    description: "Write an higher-order function, reduce, from scratch that takes two arguments: the first is an array, the second is a callback that will be called with 3 arguments: the result of the previous callback call, the current value of the array, and the current index of the array.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 80
  )
  Question.create(
    title: "Implement Wait",
    description: "Write an higher-order function, wait, that calls its callback and waits delay milliseconds before another call is allowed. Returns last return value until delay ends. Use the previous method add as the callback function",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 100
  )

dg = DrillGroup.create category:'jQuery basics', difficulty:'easy', description:'Selectors', user_id: users[0].id
  Question.create(
    title: "Basic Selectors 1",
    description: "Write a line of jQuery code that hides elements of classes 'small' and 'orange' inside a div of class 'container'.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 15
  )
  Question.create(
    title: "Basic Selectors 2",
    description: "Write a line of jQuery code that replaces an element with class of 'medium' with 'small' inside a div of class 'container'.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 15
  )
  Question.create(
    title: "Basic Selectors 3",
    description: "Write a line of jQuery code that toggles an element with class of 'green' when a button is clicked.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 16
  )
  Question.create(
    title: "Basic Selectors 4",
    description: "Write a line of jQuery code that fades and slides its own button of class 'self-disappear' when clicked.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 22
  )

dg = DrillGroup.create category:'jQuery trials', difficulty:'normal', description:'Lab exercises', user_id: users[0].id
  Question.create(
    title: "jQuery Lab 1",
    description: "Given github.com/CodeCoreYVR/jquery_lab... make it so that when the spacebar key is pressed, append a small blue circle to the green container.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 33
  )
  Question.create(
    title: "jQuery Lab 2",
    description: "Given github.com/CodeCoreYVR/jquery_lab... make it so that the Form Message shows the number of characters remaining (14 characters maximum) as you type in the text input. (e.g. '3 characters remaining')",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 40
  )
  Question.create(
    title: "jQuery Lab 3",
    description: "Given github.com/CodeCoreYVR/jquery_lab... make it so that when a user submits the form, use the value in the input field as the color for the elements to be removed from the form.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 45
  )
  Question.create(
    title: "jQuery Lab 4",
    description: "Given github.com/CodeCoreYVR/jquery_lab... make it so that when a user enters an invalid color show them an alert message telling them, 'Entered color is not a valid option!'",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 50
  )


dg = DrillGroup.create category:'jQuery advanced', difficulty:'hard', description:'More Lab exercises', user_id: users[0].id
  Question.create(
    title: "jQuery Lab 5",
    description: "Given github.com/CodeCoreYVR/jquery_lab... make it so that when a user submits the form, it clears the text in the input field.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 60
  )
  Question.create(
    title: "jQuery Lab 6",
    description: "Given github.com/CodeCoreYVR/jquery_lab... make it so that when a user types in the text input, change the Form Message to be the same as what the user types.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 65
  )
  Question.create(
    title: "jQuery Lab 7",
    description: "Given github.com/CodeCoreYVR/jquery_lab... make it so that when a user types in the text input, change the Form Message to be the REVERSE as what the user types.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 70
  )
  Question.create(
    title: "jQuery Lab 8",
    description: "Given github.com/CodeCoreYVR/jquery_lab... set a delegated click handler on the orange container so that red shapes are removed when they are clicked.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 80
  )

dg = DrillGroup.create category:'Ruby basics', difficulty:'easy', description:'The Rubyness of Ruby', user_id: users[0].id
  Question.create(
    title: "Rubyness 1",
    description: "Are integers first-class objects in Ruby?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 10
  )
  Question.create(
    title: "Rubyness 2",
    description: "That code behaviour is predictable is known in Ruby as the Principle of _____ ______",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 10
  )
  Question.create(
    title: "Rubyness 3",
    description: "'Array#second through #fifth' is an example of _____ _________",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 15
  )
  Question.create(
    title: "Rubyness 4",
    description: "Ruby values _________ over Configuration",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 15
  )

dg = DrillGroup.create category:'Ruby collections', difficulty:'normal', description:'Arrays', user_id: users[0].id
  Question.create(
    title: "Built in methods 1",
    description: "What method can be called to reverse the order of an array?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 30
  )
  Question.create(
    title: "Built in methods 2",
    description: "What method can be called to randomize the order of an array?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 30
  )
  Question.create(
    title: "Built in methods 3",
    description: "You can use just a part of an array using what built-in method?",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 35
  )
  Question.create(
    title: "String to Array",
    description: "Write code that parses the sentence 'Mary had a little lamb' into an array with the words as its elements.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 37
  )

dg = DrillGroup.create category:'Ruby OOP 1', difficulty:'hard', description:'Classes and Models', user_id: users[0].id
  Question.create(
    title: "OOP 1",
    description: "A child class inherits all the features of its parent class. This is called ________.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 60
  )
  Question.create(
    title: "OOP 2",
    description: "__________ means that the internal representation of an object is hidden from the outside.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 60
  )
  Question.create(
    title: "OOP 3",
    description: "__________ is the provision of a single interface to entities of different types.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 60
  )
  Question.create(
    title: "OOP 4",
    description: "There are two main advantages of a modules are: provision of a ________ which prevents name clashes and _______ which eliminates the need for multiple inheritance.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 60
  )

dg = DrillGroup.create category:'RoR basics', difficulty:'easy', description:'Intro to Ruby on Rails', user_id: users[0].id
  Question.create(
    title: "MVC",
    description: "MVC stands for _______, _________, _________.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 10
  )
  Question.create(
    title: "DRY",
    description: "DRY is a Ruby on Rails principle that stands for ____ _______ _________.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 10
  )
  Question.create(
    title: "New app",
    description: "To start coding a new app named 'blog', type ______________ on the terminal.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 12
  )
  Question.create(
    title: "Starting a server",
    description: "To start a rails server, type ______________ on the terminal.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 12
  )

dg = DrillGroup.create category:'RoR ORM', difficulty:'normal', description:'ActiveRecord CRUD', user_id: users[0].id
  Question.create(
    title: "Generating Models",
    description: "To generate a model 'user', type ______________ on the terminal.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 30
  )
  Question.create(
    title: "Table relationships",
    description: "To be sure a model 'question' refers to a model 'user', one can type ______________ on the terminal as the 'question' model is also created.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 35
  )
  Question.create(
    title: "Validation 1",
    description: "One checks for ________ to guarantee the existence of a property's value in the model.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 36
  )
  Question.create(
    title: "Validation 2",
    description: "One checks for ________ to guarantee the property's value is never duplicated in the model.",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 36
  )

dg = DrillGroup.create category:'RoR Navigation', difficulty:'hard', description:'Routing', user_id: users[0].id
  Question.create(
    title: "Basic Routing 1",
    description: "Write routing code that does the following: (HTTP Verb: get - path: /questions/:id ) ==> questions controller / show action",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 60
  )
  Question.create(
    title: "Basic Routing 2",
    description: "Write routing code that does the following: (HTTP Verb: get - path: /faq ) ==> home controller / faq action",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 60
  )
  Question.create(
    title: "Advanced Routing 1",
    description: "Use scope or namespace methods as described in guides.rubyonrails.org/routing.html to create the following routes:
    HTTP Verb: GET
    URL: /admin/questions
    Routes to: A index action inside a Questions Controller located inside a sub-folder named admin (inside app/controllers folder).",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 80
  )
  Question.create(
    title: "Advanced Routing 2",
    description: "Use scope or namespace methods as described in guides.rubyonrails.org/routing.html to create the following routes:
    HTTP Verb: GET
    URL: /admin/questions
    Routes to: A index action inside a Questions Controller",
    user_id: users[0].id,                    #admin Allain created this answer, necessary to not break validation
    drill_group_id: dg.id,
    points: 90
  )


#setting to a var for convenience
drill_groups = DrillGroup.all
p DrillGroup
p drill_groups


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
500.times do
  uq = UsersQuestion.new(
    user_id: (users.sample).id,
    question_id: (questions.sample).id,
    last_answer: "this is the answer",
    is_correct: true,
    num_attempts: rand(1..10)
  )
  if uq.valid?
    uq.save
  end
end


answers = Answer.all
puts "Created #{users.count} users"
puts "Created #{questions.count} questions"
puts "Created #{answers.count} answers"
puts "Created #{UsersQuestion.all.count} correct attempts"
puts "Created #{Badge.all.count} badges"   #embadged users must be calculated
