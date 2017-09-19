* This application is called Code Drillz. Intended for rigorous training and learning purposes,
  Code Drillz allows students to challenge a series of questions in a drill group set.
  These questions are related to varying coding topics created by an administrator.
* Upon answering correctly, students will also be shown varying solutions to the question.
* A leaderboard feature was implemented via an point value system (set by the administrator)
that allows the student to see their rank among other students.


To start this project, please run:

     `rails db:create rails db:migrate rails db:seed `


To login as an administrator, please use the following Email and Password:

          jcui@quiz.edu   password: 12345

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

*******************
****GENERATE MODELS

rails g model user first_name:string last_name:string username:string email:string password_digest is_admin:boolean total_pts:integer

rails g model drill_group category:string description:text difficulty:string

rails g model question description:text points:integer

rails g model users_question is_correct:boolean last_answer:text num_attempts:integer

rails g model answers body:text

rails g model badge badge_name:string threshhold:string value:integer #user:references

#with the exception of badge, it's the migrations that hold the table associations

****ADDS TO GEMFILE
uncommented bcrypt

added to top:
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'

To test/dev
gem 'faker'
gem 'rspec-rails', '~> 3.5'
gem 'rails-controller-testing'
gem 'factory_girl_rails'




****EDITS to Migration
adding t.references to questions, answers, users_questions


****
edited the model files to reflect associations

****
added to GEMFILE

gem 'cancancan'
gem 'font-awesome-rails'
****
migration to add title to questions table
****

added validations to user.rb

rails g model drill name user:references drill_group:references points:integer

added validations to all rbs

![JSON](https://raw.githubusercontent.com/jackie-ell/ROF/master/public/images/1.png)

![JSON](https://raw.githubusercontent.com/jackie-ell/ROF/master/public/images/2.png)

![JSON](https://raw.githubusercontent.com/jackie-ell/ROF/master/public/images/3.png)

![JSON](https://raw.githubusercontent.com/jackie-ell/ROF/master/public/images/4.png)

![JSON](https://raw.githubusercontent.com/jackie-ell/ROF/master/public/images/5.png)

![JSON](https://raw.githubusercontent.com/jackie-ell/ROF/master/public/images/6.png)

![JSON](https://raw.githubusercontent.com/jackie-ell/ROF/master/public/images/7.png)

![JSON](https://raw.githubusercontent.com/jackie-ell/ROF/master/public/images/8.png)

![JSON](https://raw.githubusercontent.com/jackie-ell/ROF/master/public/images/9.png)

![JSON](https://raw.githubusercontent.com/jackie-ell/ROF/master/public/images/10.png)
