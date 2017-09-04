require 'faker'
# Seed users
p 'Removing all old stuff'
Message.destroy_all
Conversation.destroy_all
Match.destroy_all
User.destroy_all

25.times do
  person = User.new()
  person.first_name = Faker::Name.first_name
  person.last_name = Faker::Name.last_name
  person.email = Faker::Internet.email(person.first_name)
  person.password = '123456'
  person.gender = ["male", "female", "non_binary"].sample
  person.description = Faker::Lorem.paragraphs(2..10)
  person.facebook_picture_url = "https://source.unsplash.com/collection/302501/"
  person.save
  puts 'User created!'
  p person
end

# Seeding matches
5.times do
  offset = rand(1..10)
  user_1 = User.offset(offset).first
  match = Match.create(first_user: user_1, second_user: User.first)
  p "Created match"
  p "#{match.first_user} likes #{match.second_user}"
end

# Seeding a few mutuals
p "Making some matches mutual"
3.times do
  match = Match.all.sample
  match.mutual = true
  match.save
  p match
  p match.mutual
end

# Creating a few conversations
p "Creating some conversations"
mutuals = Match.where(mutual: true)
convo_1 = Conversation.create(match: mutuals.first)
convo_2 = Conversation.create(match: mutuals.second)
p convo_1
p convo_2

# Seeding messages
# For convo_1
p "Seeding messages in convo 1"
convo_users = [convo_1.match.first_user, convo_1.match.second_user]
10.times do
  Message.create(conversation: convo_1, content: Faker::Lorem.sentence, user: convo_users.sample)
  p "Created message"
end
p convo_1.messages
