# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sample_u = User.find_by_email("sample_student@devfiltr.io")
unless sample_u
  puts "Creating sample student"
  sample_u = User.create!({
    :email => "sample_student@devfiltr.io",
    :password => "p@ssword", 
    :password_confirmation => "p@ssword" 
  })
end

sample_t = User.find_by_email("sample_admin@devfiltr.io")
unless sample_t
  puts "Creating sample admin"
  sample_t = User.create!({
    :email => "sample_admin@devfiltr.io",
    :password => "p@ssword", 
    :password_confirmation => "p@ssword" 
  })
end