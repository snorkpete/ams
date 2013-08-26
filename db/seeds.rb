# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
Role.find_or_create_by_name('admin')

puts 'Add jonaski users'
user = User.find_or_create_by_email name: 'Kion Stephen', email:'kion.stephen@jonaski.com',
                                    password: 'changemenow', password_confirmation: 'changemenow' 
user.add_role :admin

user = User.find_or_create_by_email name: 'Joel Millington', email:'joel.millington@jonaski.com',
                                    password: 'changemenow', password_confirmation: 'changemenow' 
user.add_role :admin
