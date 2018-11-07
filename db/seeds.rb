require 'faker'

def user_table
  20.times do
    @pass = Faker::Internet.password
    user = User.create!(
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      password: @pass,
      password_confirmation: @pass
      )
	end
end

def gossip_table
  40.times do
    gossip = Gossip.create!(
			user_id: Faker::Number.between(1, 21),
			title: Faker::HowIMetYourMother.catch_phrase,
			content: Faker::HowIMetYourMother.quote
			)
  end
end

user_table
gossip_table