user1 = User.create!(email: 'a@a.com', password: '123456')
user2 = User.create!(email: 'b@b.com', password: '123456')
user3 = User.create!(email: 'c@c.com', password: '123456')
user4 = User.create!(email: 'd@d.com', password: '123456')

profile1 = Profile.create!(username: 'alessio', first_name: 'Alessio', last_name: 'Palumbo', mobile_number: "#{ENV['MY_MOBILE']}", user: user1)
profile2 = Profile.create!(username: 'john', first_name: 'John', last_name: 'Voon', mobile_number: "#{ENV['JOHN_MOBILE']}", user: user2)
profile3 = Profile.create!(username: 'glenn', first_name: 'Glenn', last_name: 'Dimaliwat', mobile_number: "#{ENV['GLENN_MOBILE']}", user: user3)
profile4 = Profile.create!(username: 'alex', first_name: 'Alex', last_name: 'Farries', mobile_number: "#{ENV['ALEX_MOBILE']}", user: user4)


Listing.create!(title: "One bedroom", city: "Melbourne", street_address: "220 Spencer Street", country_code: "au", bed_count: "4", bedroom_count: "3", bathroom_count: "2", description: "Quiet cozy place", night_fee_cents: 40, cleaning_fee_cents: 60, host_id: 1)
Listing.create!(title: "Two bedroom", city: "Melbourne", street_address: "5 Bourke Street", country_code: "au", bed_count: "5", bedroom_count: "2", bathroom_count: "1", description: "Beautiful area", night_fee_cents: 60, cleaning_fee_cents: 80, host_id: 2)
Listing.create!(title: "Studio", city: "Melbourne", street_address: "65 Albert Park", country_code: "au", bed_count: "7", bedroom_count: "3", bathroom_count: "5", description: "central", night_fee_cents: 100, cleaning_fee_cents: 70, host_id: 3)

conv1 = Conversation.create!(host_id: 1, guest_id: 4)

Message.create!(conversation_id: 1, user_id: 4, body: 'Hi Joe!')
Message.create!(conversation_id: 1, user_id: 1, body: 'Hey Matt !')
Message.create!(conversation_id: 1, user_id: 4, body: 'How you doing')
Message.create!(conversation_id: 1, user_id: 1, body: 'Great and you?')
Message.create!(conversation_id: 1, user_id: 4, body: 'Great!')
Message.create!(conversation_id: 1, user_id: 1, body: 'Awesome!')
