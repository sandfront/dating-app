require 'faker'
# 20.times do
#   person = User.new()
#   person.first_name = Faker::Name.first_name
#   person.last_name = Faker::Name.last_name
#   person.email = Faker::Internet.email(person.first_name)
#   person.password = '123456'
#   person.description = Faker::Lorem.paragraphs(2..10)
#   # random_men = "https://randomuser.me/api/portraits/men/#{(1..100).to_a.sample}.jpg"
#   # random_women = "https://randomuser.me/api/portraits/men/#{(1..100).to_a.sample}.jpg"
#   person.facebook_picture_url = "https://source.unsplash.com/collection/302501/"
#   person.save
#   puts 'User created!'
#   p person
# end

# Seeding matches
Match.destroy_all
10.times do
  offset = rand(1..10)
  match = Match.create(first_user: User.offset(offset).first , second_user_id: 1)
  p match
end




