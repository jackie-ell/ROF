# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

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

rails g model badge badge_name:string threshhold:string value:integer user:references

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
