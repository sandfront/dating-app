require 'faker'
puts "Destroying users"
User.destroy_all
20.times do
  person = User.new()
  person.first_name = Faker::Name.first_name
  person.last_name = Faker::Name.last_name
  person.email = Faker::Internet.email(person.first_name)
  person.password = '123456'
  person.description = Faker::Lorem.paragraphs(2..10)
  # random_men = "https://randomuser.me/api/portraits/men/#{(1..100).to_a.sample}.jpg"
  # random_women = "https://randomuser.me/api/portraits/men/#{(1..100).to_a.sample}.jpg"
  person.facebook_picture_url = "https://source.unsplash.com/collection/302501/"
  person.save
  puts 'User created!'
  p person
end





