
require 'faker'

20.times do |person|
  person = User.new()
  person.first_name = Faker::Name.first_name
  person.last_name = Faker::Name.last_name
  person.email = Faker::Internet.email
  person.password = '123456'
  person.description = Faker::Lorem.words(20..40)
  random_men = "https://randomuser.me/api/portraits/men/#{(1..100).to_a.sample}.jpg"
  random_women = "https://randomuser.me/api/portraits/men/#{(1..100).to_a.sample}.jpg"
  person.facebook_picture_url = random_men
  person.save
  puts 'User created!'
end





